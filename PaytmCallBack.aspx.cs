using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using paytm;

namespace RailwayTicketingProject
{
    public partial class PaytmCallBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String merchantKey = "#VI54qIaAMs8g#Pw";
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                string paytmChecksum = "";
                foreach (string key in Request.Form.Keys)
                {
                    parameters.Add(key.Trim(), Request.Form[key].Trim());
                }
                if (parameters.ContainsKey("CHECKSUMHASH"))
                {
                    paytmChecksum = parameters["CHECKSUMHASH"];
                    parameters.Remove("CHECKSUMHASH");
                }
                if (CheckSum.verifyCheckSum(merchantKey, parameters, paytmChecksum))
                {
                    string paytmStatus = parameters["STATUS"];
                    string txnId = parameters["TXNID"];
                    lbltransaction.Text = "Transaction Id : " + txnId;
                    if (paytmStatus == "TXN_SUCCESS")
                    {
                        h1Message.Text = "Your payment is success";
                        string transactionID = Request.QueryString["transactionID"].ToString();
                        List<Tuple<string, string>> parametersList = new List<Tuple<string, string>>();
                        parametersList.Add(new Tuple<string, string>("@transactionId", transactionID));
                        parametersList.Add(new Tuple<string, string>("@choice", "Select"));
                        var data = SqlDataBind.GetDataByStoredProcedure("usp_InsertUpdateTransactionData", "ConnectionString", parametersList);
                        if (data.Tables[0].Rows.Count > 0)
                        {
                            string amount = data.Tables[0].Rows[0]["Amount"].ToString();
                            string username = data.Tables[0].Rows[0]["Username"].ToString();
                            Session["username"] = username;
                            List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
                            parameterList.Add(new Tuple<string, string>("@username", username));
                            parameterList.Add(new Tuple<string, string>("@choice", "Select"));
                            var data1 = SqlDataBind.GetDataByStoredProcedure("usp_GetUpdateUserProfileData", "ConnectionString", parameterList);
                            if (data.Tables[0].Rows.Count > 0)
                            {
                                int curr_balance = Convert.ToInt32(data1.Tables[0].Rows[0]["CurrentBalance"]);
                                int new_balance = curr_balance + Convert.ToInt32(amount);

                                List<Tuple<string, string>> parameterList1 = new List<Tuple<string, string>>();
                                parameterList1.Add(new Tuple<string, string>("@username", username));
                                parameterList1.Add(new Tuple<string, string>("@currentbalance", new_balance.ToString()));
                                var data2 = SqlDataBind.SaveDataByStoredProcedure("usp_UpdateCurrentUserProfileBalance", "ConnectionString", parameterList1);
                                if (data2 > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Amount added to your wallet successfully');", true);
                                    lbltransaction.Text = "Transaction ID : " + Request.Form["txnid"] + " has been completed successfully";
                                    List<Tuple<string, string>> parametersList1 = new List<Tuple<string, string>>();
                                    parametersList1.Add(new Tuple<string, string>("@transactionId", transactionID));
                                    parametersList1.Add(new Tuple<string, string>("@status", "Success"));
                                    var data3 = SqlDataBind.SaveDataByStoredProcedure("usp_InsertUpdateTransactionData", "ConnectionString", parametersList1);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Something went wrong at our end');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Something went wrong at our end');", true);
                        }
                    }
                    else if (paytmStatus == "PENDING")
                    {
                        h1Message.Text = "Payment is pending !";
                    }
                    else if (paytmStatus == "TXN_FAILURE")
                    {
                        h1Message.Text = "Payment Failed !";
                        string transactionId = Request.QueryString["transactionID"].ToString();
                        lbltransaction.Text = "Transaction ID : " + Request.Form["txnid"];
                        List<Tuple<string, string>> parametersList1 = new List<Tuple<string, string>>();
                        parametersList1.Add(new Tuple<string, string>("@transactionId", transactionId));
                        parametersList1.Add(new Tuple<string, string>("@status", "Failed"));
                        var data = SqlDataBind.SaveDataByStoredProcedure("usp_InsertUpdateTransactionData", "ConnectionString", parametersList1);
                    }
                }
                else
                {
                    Response.Write("Something Went Wrong");
                }
            }
        }
    }
}