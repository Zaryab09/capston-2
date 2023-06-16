using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageBedroom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showBedroom();
    }
    protected void showBedroom()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var queryBedroom = db.getBedroom();
            GVbedroom.DataSource = queryBedroom;
            GVbedroom.DataBind();
        }
    }
    protected void GVbedroom_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GVbedroom_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVbedroom_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddBedroom.aspx?bid=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int Bedroom = Convert.ToInt32(e.CommandArgument);
                db.deleteBedroom(Bedroom);
                showBedroom();
                lblMessage.Text = "Bedroom deleted successfully!";
            }
        }
    }
}