using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPropertyArea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                if (Request.QueryString["paid"] != null)
                {
                    int Area = Convert.ToInt32(Request.QueryString["paid"]);
                    tblPropertyArea a = db.tblPropertyAreas.FirstOrDefault(x => x.AreaID == Area);
                    if (a != null)
                    {
                        txbPropertyArea.Text = a.PropertyArea;
                    }
                }
            }
        }
    }

    protected void btnPropertyArea_Click(object sender, EventArgs e)
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
                var queryArea = db.AreaDuplication(txbPropertyArea.Text).ToList();
                if (queryArea.Count > 0)
                {
                    lblDuplication.Text = "Property area already exist!";
                    lblMessage.Text = "";
                    return;
                }
                else
                {
                    lblMessage.Text = "Property area updated successfully!";
                    lblDuplication.Text = "";
                }
            tblPropertyArea a = null;
            if (Request.QueryString["paid"] != null)
            {
                int Area = Convert.ToInt32(Request.QueryString["paid"]);
                a = db.tblPropertyAreas.FirstOrDefault(x => x.AreaID == Area);
            }
            else
            {
                a = new tblPropertyArea();
            }
            a.PropertyArea = txbPropertyArea.Text;
            if (Request.QueryString["paid"] == null)
            {
                db.tblPropertyAreas.Add(a);
                lblMessage.Text = "Property area saved successfully!";
            }
            db.SaveChanges();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["paid"] == null)
        {
            Response.Redirect("AddPropertyArea.aspx");
        }
        if (Request.QueryString["paid"] != null)
        {
            Response.Redirect("ManagePropertyArea.aspx");
        }
    }
}