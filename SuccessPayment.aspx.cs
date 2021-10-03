using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class SuccessPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string transactionId = Request.Form["txnid"].ToString();
                List<Tuple<string, string>> parametersList = new List<Tuple<string, string>>();
                parametersList.Add(new Tuple<string, string>("@transactionId", transactionId));
                parametersList.Add(new Tuple<string, string>("@choice", "Select"));
                var data = SqlDataBind.GetDataByStoredProcedure("usp_InsertUpdateTransactionData", "ConnectionString", parametersList);
                if (data.Tables[0].Rows.Count > 0)
                {
                    string amount = data.Tables[0].Rows[0]["Amount"].ToString();
                    string username= data.Tables[0].Rows[0]["Username"].ToString();

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
                            parametersList1.Add(new Tuple<string, string>("@transactionId", transactionId));
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
        }
    }
}