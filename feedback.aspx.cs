using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Text;
using System.Security.Cryptography;
using System.Web.DynamicData;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace RailwayTicketingProject
{
    public partial class feedback : System.Web.UI.Page
    {
        string rating;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            List<Tuple<string, string>> parametersList = new List<Tuple<string, string>>();
            parametersList.Add(new Tuple<string, string>("@subject", ddlsubject.SelectedValue));
            parametersList.Add(new Tuple<string, string>("@name", txtname.Text));
            parametersList.Add(new Tuple<string, string>("@email", txtemail.Text));
            parametersList.Add(new Tuple<string, string>("@mobile", txtmobile.Text));
            parametersList.Add(new Tuple<string, string>("@comment", comment.InnerText));
            parametersList.Add(new Tuple<string, string>("@rating",rating));
            var data = SqlDataBind.SaveDataByStoredProcedure("usp_InsertFeedbackData", "ConnectionString", parametersList);
            if (data > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Feedback Submitted Successfully');", true);
            }
        }

        protected void recommend1_CheckedChanged(object sender, EventArgs e)
        {
            rating = "Definitely";
        }

        protected void recommend2_CheckedChanged(object sender, EventArgs e)
        {
            rating = "Most Likely";
        }

        protected void recommend3_CheckedChanged(object sender, EventArgs e)
        {
            rating = "Likely";
        }

        protected void recommend4_CheckedChanged(object sender, EventArgs e)
        {
            rating = "Most not Likely";
        }

        protected void recommend5_CheckedChanged(object sender, EventArgs e)
        {
            rating = "Not Likely";
        }
    }
}