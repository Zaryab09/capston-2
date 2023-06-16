using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddAreaUnit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                if (Request.QueryString["auid"] != null)
                {
                    int AreaUnit = Convert.ToInt32(Request.QueryString["auid"]);
                    tblAreaUnit au = db.tblAreaUnits.FirstOrDefault(x => x.AreaUnitID == AreaUnit);
                    if (au != null)
                    {
                        txbAddUnit.Text = au.AreaUnit;
                    }
                }
            }
        }
    }

    protected void btnAddUnit_Click(object sender, EventArgs e)
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
                var query = db.areaUnitDuplication(txbAddUnit.Text).ToList();
                if (query.Count > 0)
                {
                    lblDuplication.Text = "Area unit already exist!";
                    lblMessage.Text = "";
                    return;
                }
                else
                {
                    lblMessage.Text = "Area unit updated successfully!";
                    lblDuplication.Text = "";
                }

            tblAreaUnit a = null;
            if (Request.QueryString["auid"] != null)
            {
                int AreaUnit = Convert.ToInt32(Request.QueryString["auid"]);
                a = db.tblAreaUnits.FirstOrDefault(x => x.AreaUnitID == AreaUnit);
            }
            else
            {
                a = new tblAreaUnit();
            }
            a.AreaUnit = txbAddUnit.Text;
            if (Request.QueryString["auid"] == null)
            {
                db.tblAreaUnits.Add(a);
                lblMessage.Text = "Area unit saved successfully!";
            }
            db.SaveChanges();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["auid"] == null)
        {
            Response.Redirect("AddAreaUnit.aspx");
        }
        if (Request.QueryString["auid"] != null)
        {
            Response.Redirect("ManageAreaUnit.aspx");
        }
    }
}