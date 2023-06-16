using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuickLinks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAll();
    }
    protected void showAll()
    {
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
            int cityid = Convert.ToInt32(Request.QueryString["sid"]);
            var querySale = db.saleLink(cityid).ToList();
            if (querySale.Count > 0)
            {
                GVquickLinkSale.DataSource = querySale;
                GVquickLinkSale.DataBind();
                message.InnerHtml = "";
            }
            else
            {
                message.InnerHtml = "No property found!";
            }
        }
    }

    protected void GVquickLinkSale_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVquickLinkSale.PageIndex = e.NewPageIndex;
        showAll();
    }
    protected void GVquickLinkSale_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewDetails")
        {
            Response.Redirect("HouseDetails.aspx?vid=" + e.CommandArgument);
        }
    }
}