using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class seat_select : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
                    parameterList.Add(new Tuple<string, string>("@Id", Request.QueryString["TrainID"]));
                    var data = SqlDataBind.GetDataByStoredProcedure("usp_GetTrainDataById", "ConnectionString", parameterList);
                    if (data.Tables[0].Rows.Count > 0)
                    {
                        txtTrainNumber.Text = data.Tables[0].Rows[0]["TrainNumber"].ToString();
                        txtTrainName.Text = data.Tables[0].Rows[0]["TrainName"].ToString();
                        txtClass.Text = data.Tables[0].Rows[0]["ClassType"].ToString();
                        txtSource.Text = data.Tables[0].Rows[0]["Source"].ToString();
                        txtDestination.Text = data.Tables[0].Rows[0]["Destination"].ToString();
                        txtJourneyDate.Text = data.Tables[0].Rows[0]["Date"].ToString();
                        txtArrivalTime.Text = data.Tables[0].Rows[0]["ArrivalTime"].ToString();
                        txtDepartureTime.Text = data.Tables[0].Rows[0]["DepartureTime"].ToString();
                        txtName.Focus();
                    }
                    else
                    {
                        Response.Redirect("UserLogin.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                    }
                }
                else
                {
                    Response.Redirect("UserLogin.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                }
            }
        }
        //private void SetInitialRow()
        //{
        //    int noofpassengers = Convert.ToInt32(txtNoOfPassengers.Text);
        //    DataTable dt = new DataTable();
        //    DataRow dr = null;

        //    for (int i = 1; i <= noofpassengers; i++)
        //    {
        //        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        //        dt.Columns.Add(new DataColumn("txtName", typeof(string)));
        //        dt.Columns.Add(new DataColumn("txtAge", typeof(string)));
        //        dt.Columns.Add(new DataColumn("ddlGender", typeof(string)));
        //        dt.Columns.Add(new DataColumn("txtTrainNumber", typeof(string)));
        //        dr = dt.NewRow();
        //        dr["RowNumber"] = i;
        //        dr["txtName"] = string.Empty;
        //        dr["txtAge"] = string.Empty;
        //        dr["ddlGender"] = string.Empty;
        //        dr["txtTrainNumber"] = txtTrainNumber.Text;
        //        dt.Rows.Add(dr);

        //    }
        //    ViewState["CurrentTable"] = dt;
        //    gvBlog.DataSource = dt;
        //    gvBlog.DataBind();

        //}

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            int noofpassengers = Convert.ToInt32(txtNoOfPassengers.Text);
            List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
            parameterList.Add(new Tuple<string, string>("@trainnumber", txtTrainNumber.Text));
            parameterList.Add(new Tuple<string, string>("@date", txtJourneyDate.Text));
            parameterList.Add(new Tuple<string, string>("@choice", "Select"));
            var data = SqlDataBind.GetDataByStoredProcedure("usp_GetUpdateVacantSeats", "ConnectionString", parameterList); //Get Vacant Seats from coach table
            if (data.Tables[0].Rows.Count > 0)
            {
                parameterList.Clear();
                int vacantseats = Convert.ToInt32(data.Tables[0].Rows[0]["TotalSeats"]);
                if (vacantseats > noofpassengers)
                {
                    parameterList.Add(new Tuple<string, string>("@trainnumber", txtTrainNumber.Text));
                    parameterList.Add(new Tuple<string, string>("@classtype", txtClass.Text));
                    var data1 = SqlDataBind.GetDataByStoredProcedure("usp_GetFareandKM", "ConnectionString", parameterList); //Get Fare and KM from train and class tables.
                    if (data1.Tables[0].Rows.Count > 0)
                    {
                        parameterList.Clear();
                        int KM = Convert.ToInt32(data1.Tables[0].Rows[0]["KM"]);
                        int fare = Convert.ToInt32(data1.Tables[0].Rows[0]["Fare"]);
                        int initial_amt = KM + fare;
                        int final_amt = initial_amt * noofpassengers;
                        parameterList.Add(new Tuple<string, string>("@username", username));
                        parameterList.Add(new Tuple<string, string>("@choice", "Select"));
                        var data2 = SqlDataBind.GetDataByStoredProcedure("usp_GetUpdateUserProfileData", "ConnectionString", parameterList);//Select user current balance
                        if (data2.Tables[0].Rows.Count > 0)
                        {
                            parameterList.Clear();
                            int curr_balance = Convert.ToInt32(data2.Tables[0].Rows[0]["CurrentBalance"]);
                            if (curr_balance > final_amt)
                            {
                                int new_balance = curr_balance - final_amt;
                                parameterList.Add(new Tuple<string, string>("@username", username));
                                parameterList.Add(new Tuple<string, string>("@currentbalance", new_balance.ToString()));
                                var data3 = SqlDataBind.SaveDataByStoredProcedure("usp_UpdateCurrentUserProfileBalance", "ConnectionString", parameterList);//Update balance after booking ticket
                                if (data3 > 0)
                                {
                                    parameterList.Clear();
                                    int new_seats = vacantseats - noofpassengers;
                                    parameterList.Add(new Tuple<string, string>("@trainnumber", txtTrainNumber.Text));
                                    parameterList.Add(new Tuple<string, string>("@totalseats", new_seats.ToString()));
                                    parameterList.Add(new Tuple<string, string>("@date", txtJourneyDate.Text));
                                    var data4 = SqlDataBind.SaveDataByStoredProcedure("usp_GetUpdateVacantSeats", "ConnectionString", parameterList);//Update seats of seat booked in coach table.
                                    if (data4 > 0)
                                    {
                                        parameterList.Clear();
                                        //generate random number for ticket id
                                        Random rnd = new Random();
                                        Random rnd1 = new Random();
                                        string ticket_number = rnd.Next(50000).ToString() + rnd1.Next(548775).ToString();
                                        parameterList.Add(new Tuple<string, string>("@ticketnumber", ticket_number));
                                        parameterList.Add(new Tuple<string, string>("@trainnumber", txtTrainNumber.Text));
                                        parameterList.Add(new Tuple<string, string>("@trainname", txtTrainName.Text));
                                        parameterList.Add(new Tuple<string, string>("@name", txtName.Text));
                                        parameterList.Add(new Tuple<string, string>("@source", txtSource.Text));
                                        parameterList.Add(new Tuple<string, string>("@destination", txtDestination.Text));
                                        parameterList.Add(new Tuple<string, string>("@date", txtJourneyDate.Text));
                                        parameterList.Add(new Tuple<string, string>("@departuretime", txtDepartureTime.Text));
                                        parameterList.Add(new Tuple<string, string>("@arrivaltime", txtArrivalTime.Text));
                                        parameterList.Add(new Tuple<string, string>("@classtype", txtClass.Text));
                                        parameterList.Add(new Tuple<string, string>("@totalseats", noofpassengers.ToString()));
                                        parameterList.Add(new Tuple<string, string>("@fare", final_amt.ToString()));
                                        parameterList.Add(new Tuple<string, string>("@status", "Booked"));
                                        var data5 = SqlDataBind.SaveDataByStoredProcedure("usp_SaveTicket", "ConnectionString", parameterList); //insert data into ticket table 
                                        if (data5 > 0)
                                        {
                                            parameterList.Clear();
                                            parameterList.Add(new Tuple<string, string>("@name", txtName.Text));
                                            parameterList.Add(new Tuple<string, string>("@age", txtAge.Text));
                                            parameterList.Add(new Tuple<string, string>("@gender", ddlgender.SelectedItem.Text));
                                            parameterList.Add(new Tuple<string, string>("@ticketID", ticket_number));
                                            parameterList.Add(new Tuple<string, string>("@trainnumber", txtTrainNumber.Text));
                                            var data6 = SqlDataBind.SaveDataByStoredProcedure("usp_SavePassengerDetails", "ConnectionString", parameterList); //insert data into ticket table 
                                            if (data6 > 0)
                                            {
                                                Session["ticketNumber"] = ticket_number;
                                                Response.Write("<script language='javascript'>window.alert('Ticket Booked Successfully');window.location='print-ticket.aspx','_blank';</script>");
                                                //ScriptManager.RegisterStartupScript(this, GetType(), "popup", "alert('Ticket Booked Successfully');", true);
                                            }
                                        }
                                        //insert data into passengers table also

                                    }
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "popup", "alert('Insufficient balance to book ticket, Please add balance to wallet !');", true);
                            }
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Seats already full !');", true);
                }
            }
        }
    }
}