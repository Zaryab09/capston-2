using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showAdmin();
    }
    protected void showAdmin()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var admins = db.getAdmins().ToList();
            GVadmin.DataSource = admins;
            GVadmin.DataBind();
        }
    }

    protected void GVadmin_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GVadmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVadmin_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddAdmin.aspx?aid=" + e.CommandArgument);
        }
        if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int adminid = Convert.ToInt32(e.CommandArgument);
                db.deleteAdmin(adminid);
                showAdmin();
                lblMessage.Text = "Admin deleted successfully!";
            }
        }
    }
}