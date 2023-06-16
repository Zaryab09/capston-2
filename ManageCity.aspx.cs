using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showCity();
    }
    protected void showCity()
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var city = db.getCity();
            GVcity.DataSource = city;
            GVcity.DataBind();
        }
    }
    protected void GVlocation_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GVlocation_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVlocation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("AddCity.aspx?cid=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                int city = Convert.ToInt32(e.CommandArgument);
                db.deleteCity(city);
                showCity();
                lblMessage.Text = "City deleted successfully!";
            }
        }
    }
}