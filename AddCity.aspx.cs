using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            if (Request.QueryString["cid"] != null)
            {
                using(ApnaGharEntities db = new ApnaGharEntities())
                {
                    int city = Convert.ToInt32(Request.QueryString["cid"]);
                    tblCity ct = db.tblCities.FirstOrDefault(x => x.CityID == city);
                    if (ct != null)
                    {
                        txbCity.Text = ct.CityName;
                    }
                }
            }
        }
    }

    protected void btnCity_Click(object sender, EventArgs e)
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
                var queryCity = db.cityDuplication(txbCity.Text).ToList();
                if (queryCity.Count > 0)
                {
                    lblDuplication.Text = "City already exist!";
                    lblMessage.Text = "";
                    return;
                }
                else
                {
                    lblMessage.Text = "City updated successfully!";
                    lblDuplication.Text = "";
                }

            tblCity c = null;
            if (Request.QueryString["cid"] != null)
            {
                int city = Convert.ToInt32(Request.QueryString["cid"]);
                c = db.tblCities.FirstOrDefault(x => x.CityID == city);
            }
            else
            {
                c = new tblCity();
            }
            c.CityName = txbCity.Text;
            if (Request.QueryString["cid"] == null)
            {
                db.tblCities.Add(c);
                lblMessage.Text = "City saved successfully!";
            }
            db.SaveChanges();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["cid"] == null)
        {
            Response.Redirect("AddCity.aspx");
        }
        if (Request.QueryString["cid"] != null)
        {
            Response.Redirect("ManageCity.aspx");
        }
    }
}