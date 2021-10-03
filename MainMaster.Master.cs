using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                HyperLink1.Visible = false;
                logout.Visible = true;
                username.InnerText = "Welcome " + Session["username"].ToString();
            }
            else
            {
                HyperLink1.Visible = true;                
                logout.Visible = false;
            }
        }
        protected void HyperLink2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("UserLogin.aspx");
        }
    }
}