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
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "addScript", "getDate()", true);
            if (!IsPostBack)
            {
                if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
                {
                    txtusername.Text = Request.Cookies["Username"].Value;
                    txtpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
                try
                {
                 
                }
                catch (Exception ex)
                {

                }
            }
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand("usp_GetLoginUsersData", sqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", txtusername.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            int result = (Int32)cmd.ExecuteScalar();
            if (result == 1)
            {
                string ReturnUrl = Convert.ToString(Request.QueryString["url"]);
                if (!string.IsNullOrEmpty(ReturnUrl))
                {
                    Session["username"] = txtusername.Text;
                    Response.Redirect(ReturnUrl);
                }
                else
                {
                    Session["username"] = txtusername.Text;
                    Response.Redirect("index.aspx");
                }
                if (checkrememberme1.Checked)
                {
                    Response.Cookies["Username"].Value = txtusername.Text;
                    Response.Cookies["Password"].Value = txtpassword.Text;
                    Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(1);
                }
                else
                {
                    Response.Cookies["Username"].Expires = DateTime.Now.AddMinutes(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(-1);
                }

            }
            else
            {
                Response.Write("<script>alert('Please enter valid Username and Password !')</script>");
                txtusername.Focus();
            }
            sqlConnection.Close();
        }
    }
}