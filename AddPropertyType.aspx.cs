using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPropertyType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using (ApnaGharEntities db = new ApnaGharEntities())
            {
                if (Request.QueryString["ptid"] != null)
                {
                    int property = Convert.ToInt32(Request.QueryString["ptid"]);
                    tblPropertyType pt = db.tblPropertyTypes.FirstOrDefault(x => x.TypeID == property);
                    if (pt != null)
                    {
                        txbPropertyType.Text = pt.PropertyType;
                    }
                }
            }
        }
    }

    protected void btnPropertyType_Click(object sender, EventArgs e)
    {
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
                var query = db.propertyTypeDuplication(txbPropertyType.Text).ToList();
                if (query.Count > 0)
                {
                    lblDuplication.Text = "Property type already exist!";
                    lblMessage.Text = "";
                    return;
                }
                else
                {
                    lblMessage.Text = "Property type updated successfully!";
                    lblDuplication.Text = "";
                }

            tblPropertyType p = null;
            if (Request.QueryString["ptid"] != null)
            {
                int property = Convert.ToInt32(Request.QueryString["ptid"]);
                p = db.tblPropertyTypes.FirstOrDefault(x => x.TypeID == property);
            }
            else
            {
                p = new tblPropertyType();
            }
            p.PropertyType = txbPropertyType.Text;
            if (Request.QueryString["ptid"] == null)
            {
                db.tblPropertyTypes.Add(p);
                lblMessage.Text = "Property type saved successfully!";
            }
            db.SaveChanges();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ptid"] == null)
        {
            Response.Redirect("AddPropertyType.aspx");
        }
        if (Request.QueryString["ptid"] != null)
        {
            Response.Redirect("ManagePropertyType.aspx");
        }
    }
}