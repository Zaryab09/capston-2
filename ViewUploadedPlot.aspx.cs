using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewUploadedPlot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAll();
    }
    protected void showAll()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var query = db.getPlot(Convert.ToString(Request.Cookies["UniqueNum"]["UniqueID"])).ToList();
            if (query.Count > 0)
            {
                GVuploadedPlot.DataSource = query;
                GVuploadedPlot.DataBind();
            }
            else
            {
                Hmessage.InnerHtml = "No plots uploaded!";
            }
        }
    }

    protected void GVuploadedPlot_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVuploadedPlot_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int plotid = Convert.ToInt32(e.CommandArgument);
                db.deletePlot(plotid);
                showAll();
            }
        }
    }

    protected void GVuploadedPlot_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVuploadedPlot.PageIndex = e.NewPageIndex;
        showAll();
    }
}