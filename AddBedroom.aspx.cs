using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBedroom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                if (Request.QueryString["bid"] != null)
                {
                    int bedroom = Convert.ToInt32(Request.QueryString["bid"]);
                    tblBedroom b = db.tblBedrooms.FirstOrDefault(x => x.BedroomID == bedroom);
                    if (b != null)
                    {
                        txbBedroom.Text = b.Bedroom;
                    }
                }
            }
        }
    }

    protected void btnBedroom_Click(object sender, EventArgs e)
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            tblBedroom b = null;
                var queryBedroom = db.bedroomDuplication(txbBedroom.Text).ToList();
                if (queryBedroom.Count > 0)
                {
                    lblDuplication.Text = "Bedroom already exist!";
                    lblMessage.Text = "";
                    return;
                }
                else
                {
                    lblMessage.Text = "Bedroom updated successfully!";
                    lblDuplication.Text = "";
                }

            if (Request.QueryString["bid"] != null)
            {
                int bedroom = Convert.ToInt32(Request.QueryString["bid"]);
                b = db.tblBedrooms.FirstOrDefault(x => x.BedroomID == bedroom);
            }
            else
            {
                b = new tblBedroom();
            }
            b.Bedroom = txbBedroom.Text;
            if (Request.QueryString["bid"] == null)
            {
                db.tblBedrooms.Add(b);
                lblMessage.Text = "Bedroom saved successfully!";
            }
            db.SaveChanges();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["bid"] == null)
        {
            Response.Redirect("AddBedroom.aspx");
        }
        if (Request.QueryString["bid"] != null)
        {
            Response.Redirect("ManageBedroom.aspx");
        }
    }
}