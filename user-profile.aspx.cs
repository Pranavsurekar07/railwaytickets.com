using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class user_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    if (Request.QueryString["query"] == "Profile")
                    {
                        ChangePasswordPanel.Visible = false;
                        List<Tuple<string, string>> parametersList = new List<Tuple<string, string>>();
                        parametersList.Add(new Tuple<string, string>("@username", Session["username"].ToString()));
                        parametersList.Add(new Tuple<string, string>("@choice", "Select"));
                        var data = SqlDataBind.GetDataByStoredProcedure("usp_GetUpdateUserProfileData", "ConnectionString", parametersList);
                        if (data.Tables[0].Rows.Count > 0)
                        {
                            txtfirstname.Text = data.Tables[0].Rows[0]["FirstName"].ToString();
                            txtlastname.Text = data.Tables[0].Rows[0]["LastName"].ToString();
                            txtemail.Text = data.Tables[0].Rows[0]["Email"].ToString();
                            txtmobile.Text = data.Tables[0].Rows[0]["Mobile"].ToString();
                            ddlgender.SelectedValue = data.Tables[0].Rows[0]["Gender"].ToString();
                            txtaddress.Text = data.Tables[0].Rows[0]["Address"].ToString();
                        }
                    }
                    else
                    {
                        ChangePasswordPanel.Visible = true;
                        UserProfilePanel.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("UserLogin.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                }
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string username = Session["Username"].ToString();
            if (Request.QueryString["query"] == "Profile")
            {
                List<Tuple<string, string>> parametersList = new List<Tuple<string, string>>();
                parametersList.Add(new Tuple<string, string>("@username", username.ToString()));
                parametersList.Add(new Tuple<string, string>("@firstname", txtfirstname.Text));
                parametersList.Add(new Tuple<string, string>("@lastname", txtlastname.Text));
                parametersList.Add(new Tuple<string, string>("@mobile", txtmobile.Text));
                parametersList.Add(new Tuple<string, string>("@email", txtemail.Text));
                parametersList.Add(new Tuple<string, string>("@gender", ddlgender.SelectedValue));
                parametersList.Add(new Tuple<string, string>("@address", txtaddress.Text));
                var data = SqlDataBind.SaveDataByStoredProcedure("usp_GetUpdateUserProfileData", "ConnectionString", parametersList);
                if (data > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Data saved successfully');", true);
                }
            }
            else
            {
                List<Tuple<string, string>> tuples = new List<Tuple<string, string>>();
                tuples.Add(new Tuple<string, string>("@username", username.ToString()));
                tuples.Add(new Tuple<string, string>("@password", txtconfirmnewpassword.Text));
                var data = SqlDataBind.SaveDataByStoredProcedure("usp_UpdateUserProfilePassword", "ConnectionString", tuples);
                if (data > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Password updated successfully');", true);
                }
            }
        }
    }
}
