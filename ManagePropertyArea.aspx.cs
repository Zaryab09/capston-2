using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagePropertyArea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showPropertyArea();
    }
    protected void showPropertyArea()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var queryArea = db.getPropertyArea();
            GVpropertyArea.DataSource = queryArea;
            GVpropertyArea.DataBind();
        }
    }
    protected void gvPropertyArea_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void gvPropertyArea_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gvPropertyArea_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddPropertyArea.aspx?paid=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int Area = Convert.ToInt32(e.CommandArgument);
                db.deletePropertyArea(Area);
                showPropertyArea();
                lblMessage.Text = "Property area deleted successfully!";
            }
        }
    }
}