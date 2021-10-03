using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class print_ticket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
                    parameterList.Add(new Tuple<string, string>("@ticketnumber", Session["ticketNumber"].ToString()));
                    var data = SqlDataBind.GetDataByStoredProcedure("usp_GetTicketDetailsByNumber", "ConnectionString", parameterList);
                    if (data.Tables[0].Rows.Count > 0)
                    {
                        spTrainNumber.InnerText = data.Tables[0].Rows[0]["TrainNumber"].ToString();
                        spTrainName.InnerText = data.Tables[0].Rows[0]["TrainName"].ToString();
                        spName.InnerText = data.Tables[0].Rows[0]["Name"].ToString();
                        spSource.InnerText = data.Tables[0].Rows[0]["Source"].ToString();
                        spDestination.InnerText = data.Tables[0].Rows[0]["Destination"].ToString();
                        spDate.InnerText = data.Tables[0].Rows[0]["Date"].ToString();
                        spDepTime.InnerText = data.Tables[0].Rows[0]["DepartureTime"].ToString();
                        spFare.InnerText = data.Tables[0].Rows[0]["Fare"].ToString();
                        spTicketNumber.InnerText = data.Tables[0].Rows[0]["PNR"].ToString();
                        spJourneyDate.InnerText = data.Tables[0].Rows[0]["Date"].ToString();

                    }
                }
                else
                {
                    Response.Redirect("UserLogin.aspx");
                }
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            btnPrint.Visible = true;
        }
    }
}