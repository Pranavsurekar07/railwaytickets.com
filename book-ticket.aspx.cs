using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class book_ticket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                BindData();

            }
        }
        private void BindData()
        {
            try
            {
                List<Tuple<string, string>> parametersLists = new List<Tuple<string, string>>();
                var dataddl = SqlDataBind.GetDataByStoredProcedure("usp_GetStations", "ConnectionString", parametersLists);
                if (dataddl.Tables[0].Rows.Count > 0)
                {
                    ddlsource.DataSource = dataddl.Tables[0];
                    ddlsource.DataValueField = "StationID";
                    ddlsource.DataTextField = "StationName";
                    ddlsource.DataBind();
                    ddlsource.Items.Insert(0, new ListItem("Select Source", "0"));
                }
                var data = SqlDataBind.GetDataByStoredProcedure("usp_GetStations", "ConnectionString", parametersLists);
                if (data.Tables[0].Rows.Count > 0)
                {
                    ddldestination.DataSource = dataddl.Tables[0];
                    ddldestination.DataValueField = "StationID";
                    ddldestination.DataTextField = "StationName";
                    ddldestination.DataBind();
                    ddldestination.Items.Insert(0, new ListItem("Select Destination", "0"));
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
            parameterList.Add(new Tuple<string, string>("@source", ddlsource.SelectedItem.Text));
            parameterList.Add(new Tuple<string, string>("@destination", ddldestination.SelectedItem.Text));
            parameterList.Add(new Tuple<string, string>("@date", txtDate.Text));   //2021-06-20
            parameterList.Add(new Tuple<string, string>("@class", ddlclass.SelectedItem.Text));
            var data = SqlDataBind.GetDataByStoredProcedure("usp_SearchTrainsForBookTkt", "ConnectionString", parameterList);
            if (data.Tables[0].Rows.Count > 0)
            {
                gvBlog.DataSource = data.Tables[0];
                gvBlog.DataBind();
                gvBlog.Focus();
            }
            else
            {
                gvBlog.EmptyDataText = "Trains not Available";
            }
        }
    }
}