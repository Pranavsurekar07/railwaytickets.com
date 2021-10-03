using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class FailurePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string transactionId = Request.Form["txnid"].ToString();
                lbltransaction.Text = "Transaction ID : " + Request.Form["txnid"] + " has been Failed !";
                List<Tuple<string, string>> parametersList1 = new List<Tuple<string, string>>();
                parametersList1.Add(new Tuple<string, string>("@transactionId", transactionId));
                parametersList1.Add(new Tuple<string, string>("@status", "Failed"));
                //var data = SqlDataBind.SaveDataByStoredProcedure("usp_InsertUpdateTransactionData", "ConnectionString", parametersList1);
            }
        }
    }
}