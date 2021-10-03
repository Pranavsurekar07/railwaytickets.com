using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using paytm;

namespace RailwayTicketingProject
{
    public partial class add_balance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
                    parameterList.Add(new Tuple<string, string>("@username", Session["username"].ToString()));
                    parameterList.Add(new Tuple<string, string>("@choice", "Select"));
                    var data = SqlDataBind.GetDataByStoredProcedure("usp_GetUpdateUserProfileData", "ConnectionString", parameterList);
                    lblBalance.Text = data.Tables[0].Rows[0]["CurrentBalance"].ToString() + " Rs.";
                }
                else
                {
                    Response.Redirect("UserLogin.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                }
            }
        }

        protected void btnaddbalance_Click(object sender, EventArgs e)
        {
            
            string username = Session["username"].ToString();
            List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
            parameterList.Add(new Tuple<string, string>("@username", username));
            parameterList.Add(new Tuple<string, string>("@choice", "Select"));
            var info = SqlDataBind.GetDataByStoredProcedure("usp_GetUpdateUserProfileData", "ConnectionString", parameterList);
            string email = info.Tables[0].Rows[0]["Email"].ToString();
            string mobile = info.Tables[0].Rows[0]["Mobile"].ToString();
            string firstname = info.Tables[0].Rows[0]["FirstName"].ToString();
            Random random = new Random();
            txnid.Value = Convert.ToString(random.Next(10000, 20000));
            txnid.Value = "Railway" + txnid.Value.ToString();
            string transactionId = txnid.Value;
            Double amount = Convert.ToDouble(txtAddBalance.Text);
            #region
            //String text = key.Value.ToString() + "|" + txnid.Value.ToString() + "|" + amount + "|" + "Adding Balance to Wallet" + "|" + firstname + "|" + email + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "||||||" + salt.Value.ToString();
            //byte[] message = Encoding.UTF8.GetBytes(text);
            //UnicodeEncoding UE = new UnicodeEncoding();
            //byte[] hashvalue;
            //SHA512Managed hashstring = new SHA512Managed();
            //string hex = "";
            //hashvalue = hashstring.ComputeHash(message);
            //foreach (byte x in hashvalue)
            //{
            //    hex += string.Format("{0:x2}", x);
            //}
            //hash.Value = hex;
            //System.Collections.Hashtable data = new System.Collections.Hashtable();
            //data.Add("hash", hex.ToString());
            //data.Add("txnid", txnid.Value);
            //data.Add("key", key.Value);
            //data.Add("amount", amount);
            //data.Add("firstname", firstname);
            //data.Add("email", email);
            //data.Add("phone", mobile);
            //data.Add("productinfo", "Adding Balance to Wallet");
            //data.Add("udf1", "1");
            //data.Add("udf2", "1");
            //data.Add("udf3", "1");
            //data.Add("udf4", "1");
            //data.Add("udf5", "1");
            //data.Add("surl", "https://localhost:44378/SuccessPayment.aspx");
            //data.Add("furl", "https://localhost:44378/FailurePayment.aspx");
            //data.Add("service_provider", "");
            //string strForm = PreparePOSTForm("https://test.payu.in/_payment", data);
            //Page.Controls.Add(new LiteralControl(strForm));
            //List<Tuple<string, string>> parameterList1 = new List<Tuple<string, string>>();
            //parameterList1.Add(new Tuple<string, string>("@transactionId", transactionId));
            //parameterList1.Add(new Tuple<string, string>("@amount", amount.ToString()));
            //parameterList1.Add(new Tuple<string, string>("@username", username));
            //parameterList1.Add(new Tuple<string, string>("@choice", "Insert"));
            //var transaction = SqlDataBind.GetDataByStoredProcedure("usp_InsertUpdateTransactionData", "ConnectionString", parameterList1);
            #endregion
            String merchantKey = "#VI54qIaAMs8g#Pw";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("MID", "KHWyCT32724062952611");
            parameters.Add("CHANNEL_ID", "WEB");
            parameters.Add("INDUSTRY_TYPE_ID", "Retail");
            parameters.Add("WEBSITE", "WEBSTAGING");
            parameters.Add("EMAIL", email);
            parameters.Add("MOBILE_NO", mobile);
            parameters.Add("CUST_ID", txnid.Value);
            parameters.Add("ORDER_ID", txnid.Value);
            parameters.Add("TXN_AMOUNT", amount.ToString());
            parameters.Add("CALLBACK_URL", "http://railwayticketing.online/PaytmCallBack.aspx?transactionID=" + txnid.Value); //This parameter is not mandatory. Use this to pass the callback url dynamically.
            string checksum = CheckSum.generateCheckSum(merchantKey, parameters);
            string paytmURL = "https://securegw-stage.paytm.in/order/process?orderid=" + txnid.Value;
            string outputHTML = "<html>";
            outputHTML += "<head>";
            outputHTML += "<title>Merchant Check Out Page</title>";
            outputHTML += "</head>";
            outputHTML += "<body>";
            outputHTML += "<center>Please do not refresh this page...</center>"; //you can put h1 tag here
            outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            outputHTML += "<table border='1'>";
            outputHTML += "<tbody>";
            foreach (string key in parameters.Keys)
            {
                outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
            }
            outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            outputHTML += "</tbody>";
            outputHTML += "</table>";
            outputHTML += "<script type='text/javascript'>";
            outputHTML += "document.f1.submit();";
            outputHTML += "</script>";
            outputHTML += "</form>";
            outputHTML += "</body>";
            outputHTML += "</html>";
            Response.Write(outputHTML);
            List<Tuple<string, string>> parameterList1 = new List<Tuple<string, string>>();
            parameterList1.Add(new Tuple<string, string>("@transactionId", transactionId));
            parameterList1.Add(new Tuple<string, string>("@amount", amount.ToString()));
            parameterList1.Add(new Tuple<string, string>("@username", username));
            parameterList1.Add(new Tuple<string, string>("@choice", "Insert"));
            var transaction = SqlDataBind.GetDataByStoredProcedure("usp_InsertUpdateTransactionData", "ConnectionString", parameterList1);
        }
        private string PreparePOSTForm(string url, System.Collections.Hashtable data)
        {
            string FormID = "PostForm";
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<Form id=\"" + FormID + "\" name=\"" + FormID + "\" action=\"" + url + "\" method=\"Post\">");
            foreach (System.Collections.DictionaryEntry key in data)
            {
                strForm.Append("<input type=\"hidden\" name=\"" + key.Key + "\" value=\"" + key.Value + "\">");
            }
            strForm.Append("</form>");
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + FormID + "=document." + FormID + ";");
            strScript.Append("v" + FormID + ".submit();");
            strScript.Append("</script>");
            return strForm.ToString() + strScript.ToString();
        }
    }
}