using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagePropertyType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showPropertyType();
    }
    protected void showPropertyType()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var query = db.getPropertyType();
            GVpropertyType.DataSource = query;
            GVpropertyType.DataBind();
        }
    }

    protected void managePropertyType_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void managePropertyType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void managePropertyType_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddPropertyType.aspx?ptid=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int PropertyType = Convert.ToInt32(e.CommandArgument);
                db.deletePropertyType(PropertyType);
                showPropertyType();
                lblMessage.Text = "Property type deleted successfully!";
            }
        }
    }
}