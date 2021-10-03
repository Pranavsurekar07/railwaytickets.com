using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class cancellations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CancelTktPanel.Visible = false;
                if (Session["username"] != null)
                {

                }
                else
                {
                    Response.Redirect("UserLogin.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                }
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
            parameterList.Add(new Tuple<string, string>("@ticketnumber", txtTicketNumber.Text.Trim()));
            var data = SqlDataBind.GetDataByStoredProcedure("usp_GetTicketDetails", "ConnectionString", parameterList);
            if(data.Tables[0].Rows.Count>0)
            {
                CancelTktPanel.Visible = true;
                lblPNRNumber.Text = data.Tables[0].Rows[0]["PNR"].ToString();
                lblTrainNumber.Text = data.Tables[0].Rows[0]["TrainNumber"].ToString();
                lblTrainName.Text = data.Tables[0].Rows[0]["TrainName"].ToString();
                lblName.Text = data.Tables[0].Rows[0]["Name"].ToString();
                lblSource.Text = data.Tables[0].Rows[0]["Source"].ToString();
                lblDestination.Text = data.Tables[0].Rows[0]["Destination"].ToString();
                lblDate.Text = data.Tables[0].Rows[0]["Date"].ToString();
                lblDepartureTime.Text = data.Tables[0].Rows[0]["DepartureTime"].ToString();
                lblArrivalTime.Text = data.Tables[0].Rows[0]["ArrivalTime"].ToString();
                lblClassType.Text = data.Tables[0].Rows[0]["ClassType"].ToString();
                lblTotalSeats.Text = data.Tables[0].Rows[0]["TotalSeat"].ToString();
                lblStatus.Text= data.Tables[0].Rows[0]["Status"].ToString();
                lblTotalFare.Text = data.Tables[0].Rows[0]["Fare"].ToString();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "popup", "alert('Ticket not found Please enter correct ticket number !');", true);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (lblStatus.Text == "Cancel")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('This Ticket is already deleted.');", true);
            }
            else
            {
                DateTime tickettime = System.DateTime.Parse(lblDepartureTime.Text);
                int diffofdate = System.DateTime.Today.Date.CompareTo(System.DateTime.Parse(lblDepartureTime.Text.ToString()));
                if (diffofdate >= 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('You cannot Cancel the Back Date Ticket');", true);
                }

                else if ((diffofdate == 0 && tickettime > System.DateTime.Now.AddHours(2.00)) || (diffofdate < 0))
                {
                    List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
                    parameterList.Add(new Tuple<string, string>("@ticketnumber", txtTicketNumber.Text.Trim()));
                    parameterList.Add(new Tuple<string, string>("@status", "Cancel"));
                    var data = SqlDataBind.SaveDataByStoredProcedure("usp_DeleteTicketByNumber", "ConnectionString", parameterList);
                    if (data > 0)
                    {
                        parameterList.Clear();                        
                        string username = Session["username"].ToString();
                        parameterList.Add(new Tuple<string, string>("@username", username));
                        parameterList.Add(new Tuple<string, string>("@choice", "Select"));
                        var data1 = SqlDataBind.GetDataByStoredProcedure("usp_GetUpdateUserProfileData", "ConnectionString", parameterList);
                        if (data1.Tables[0].Rows.Count >0)
                        {
                            parameterList.Clear();
                            int available_balance = Convert.ToInt32(data1.Tables[0].Rows[0]["CurrentBalance"]);
                            int total_fare = Convert.ToInt32(lblTotalFare.Text);
                            int total_balance = available_balance + total_fare;
                            parameterList.Add(new Tuple<string, string>("@username", username));
                            parameterList.Add(new Tuple<string, string>("@currentbalance", total_balance.ToString()));
                            var data2 = SqlDataBind.SaveDataByStoredProcedure("usp_UpdateCurrentUserProfileBalance", "ConnectionString", parameterList);
                            if (data2 > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Ticket Deleted Successfully...');", true);
                                CancelTktPanel.Visible = false;
                                txtTicketNumber.Text = "";
                            }
                        }
                    }
                }
            }
        
                   
        }
        
    }
}