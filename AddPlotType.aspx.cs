using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPlotType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using (ApnaGharEntities db = new ApnaGharEntities())
            {
                if (Request.QueryString["pid"] != null)
                {
                    int plot = Convert.ToInt32(Request.QueryString["pid"]);
                    tblPlotType pl = db.tblPlotTypes.FirstOrDefault(x => x.PlotTypeID == plot);
                    if (pl != null)
                    {
                        txbPlotType.Text = pl.PlotType;
                    }
                }
            }
        }
    }

    protected void btnPlotType_Click(object sender, EventArgs e)
    {
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
            var query = db.plotTypeDuplication(txbPlotType.Text).ToList();
            if (query.Count > 0)
            {
                lblDuplication.Text = "Plot type already exist!";
                lblMessage.Text = "";
                return;
            }
            else
            {
                lblMessage.Text = "Plot type updated successfully!";
                lblDuplication.Text = "";
            }

            tblPlotType p = null;
            if (Request.QueryString["pid"] != null)
            {
                int plot = Convert.ToInt32(Request.QueryString["pid"]);
                p = db.tblPlotTypes.FirstOrDefault(x => x.PlotTypeID == plot);
            }
            else
            {
                p = new tblPlotType();
            }
            p.PlotType = txbPlotType.Text;
            if (Request.QueryString["pid"] == null)
            {
                db.tblPlotTypes.Add(p);
                lblMessage.Text = "Plot type saved successfully!";
            }
            db.SaveChanges();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["pid"] == null)
        {
            Response.Redirect("AddPlotType.aspx");
        }
        if (Request.QueryString["pid"] != null)
        {
            Response.Redirect("ManagePlotType.aspx");
        }
    }
}