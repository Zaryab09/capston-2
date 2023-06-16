using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuickLinksPlot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAll();
    }
    protected void showAll()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            int pCity_id = Convert.ToInt32(Request.QueryString["pcid"]);
            var query = db.plotLink(pCity_id).ToList();
            if (query.Count > 0)
            {
                GVquickLinkPlot.DataSource = query;
                GVquickLinkPlot.DataBind();
            }
            else
            {
                message.InnerHtml = "No plots found!";
            }
        }
    }

    protected void GVquickLinkPlot_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewDetails")
        {
            Response.Redirect("PlotDetails.aspx?pid=" + e.CommandArgument);
        }
    }

    protected void GVquickLinkPlot_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVquickLinkPlot.PageIndex = e.NewPageIndex;
        showAll();
    }
}