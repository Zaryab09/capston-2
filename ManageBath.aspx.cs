using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageBath : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showBath();
    }
    protected void showBath()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var queryBath = db.getBath();
            GVbath.DataSource = queryBath;
            GVbath.DataBind();
        }
    }
    protected void GVbath_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GVbath_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVbath_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddBath.aspx?bid=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int Bath = Convert.ToInt32(e.CommandArgument);
                db.deleteBath(Bath);
                showBath();
                lblMessage.Text = "Bath deleted successfully!";
            }
        }
    }
}