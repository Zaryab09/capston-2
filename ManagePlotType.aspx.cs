using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagePlotType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAll();
    }
    protected void showAll()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var query = db.getPlotType();
            GVplotType.DataSource = query;
            GVplotType.DataBind();
        }
    }
    protected void GVplotType_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddPlotType.aspx?pid=" + e.CommandArgument);
        }
        if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int plot = Convert.ToInt32(e.CommandArgument);
                db.deletePlotType(plot);
                showAll();
                lblMessage.Text = "Plot type deleted successfully!";
            }
        }
    }

    protected void GVplotType_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GVplotType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}