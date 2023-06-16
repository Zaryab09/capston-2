using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageAreaUnit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAreaUnit();
    }
    protected void showAreaUnit()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var areaUnit = db.getAreaUnit();
            GVareaUnit.DataSource = areaUnit;
            GVareaUnit.DataBind();
        }
    }
    protected void GVareaUnit_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GVareaUnit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVareaUnit_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddAreaUnit.aspx?auid=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int AreaUnit = Convert.ToInt32(e.CommandArgument);
                db.deleteAreaUnit(AreaUnit);
                lblMessage.Text = "Area unit deleted successfuly!";
                showAreaUnit();
            }
        }
    }
}