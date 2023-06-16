using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuickLinksRent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
            int cityid = Convert.ToInt32(Request.QueryString["rid"]);
            var queryRent = db.rentLink(cityid).ToList();
            if (queryRent.Count > 0)
            {
                GVquickLinkRent.DataSource = queryRent;
                GVquickLinkRent.DataBind();
                message.InnerHtml = "";
            }
            else
            {
                message.InnerHtml = "No property found!";
            }
        }
    }

    protected void GVquickLinkRent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GVquickLinkRent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewDetails")
        {
            Response.Redirect("HouseDetails.aspx?vid=" + e.CommandArgument);
        }
    }
}