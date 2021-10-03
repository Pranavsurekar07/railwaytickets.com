using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RailwayTicketingProject
{
    public partial class train_timetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
        }
        void BindData()
        {
            var data = SqlDataBind.GetDataByStoredProcedure("usp_GetAllTableDataCMS", "ConnectionString");
            if (data.Tables[6].Rows.Count > 0)
            {
                gvBlog.DataSource = data.Tables[6];
                gvBlog.DataBind();
            }
        }
        protected void gvEvents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBlog.PageIndex = e.NewPageIndex;
            BindData();
        }
    }
}