using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewUploadedHouse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAll();
    }
    protected void showAll()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var query = db.getHouse(Convert.ToString(Request.Cookies["UniqueNum"]["UniqueID"])).ToList();
            if (query.Count > 0)
            {
                GVuploadedHouse.DataSource = query;
                GVuploadedHouse.DataBind();
            }
            else
            {
                Hmessage.InnerHtml = "No property uploaded!";
            }
        }
    }

    protected void GVuploadedHouse_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVuploadedHouse_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int houseid = Convert.ToInt32(e.CommandArgument);
                db.deleteHouse(houseid);
                showAll();
            }
        }
    }

    protected void GVuploadedHouse_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVuploadedHouse.PageIndex = e.NewPageIndex;
        showAll();
    }
}