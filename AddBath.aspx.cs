using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBath : System.Web.UI.Page
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
                    int bath = Convert.ToInt32(Request.QueryString["bid"]);
                    tblBath b = db.tblBaths.FirstOrDefault(x => x.BathID == bath);
                    if (b != null)
                    {
                        txbBath.Text = b.Bath;
                    }
                }
            }
        }
    }

    protected void btnBath_Click(object sender, EventArgs e)
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
                var queryBath = db.bathDuplication(txbBath.Text).ToList();
                if (queryBath.Count > 0)
                {
                    lblDuplication.Text = "Bath already exist!";
                    lblMessage.Text = "";
                    return;
                }
                else
                {
                    lblDuplication.Text = "";
                    lblMessage.Text = "Bath updated successfully!";
                }

            tblBath b = null;
            if (Request.QueryString["bid"] != null)
            {
                int bath = Convert.ToInt32(Request.QueryString["bid"]);
                b = db.tblBaths.FirstOrDefault(x => x.BathID == bath);
            }
            else
            {
                b = new tblBath();
            }
            b.Bath = txbBath.Text;
            if (Request.QueryString["bid"] == null)
            {
                db.tblBaths.Add(b);
                lblMessage.Text = "Bath saved successfully!";
            }
            db.SaveChanges();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["bid"] == null)
        {
            Response.Redirect("AddBath.aspx");
        }
        if (Request.QueryString["bid"] != null)
        {
            Response.Redirect("ManageBath.aspx");
        }
    }
}