using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPlot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                var queryCity = db.getCity().ToList();
                ddlCity.DataSource = queryCity;
                ddlCity.DataValueField = "CityID";
                ddlCity.DataTextField = "CityName";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Select", "0"));

                var queryType = db.getPlotType().ToList();
                ddlType.DataSource = queryType;
                ddlType.DataValueField = "PlotTypeID";
                ddlType.DataTextField = "PlotType";
                ddlType.DataBind();
                ddlType.Items.Insert(0, new ListItem("Select", "0"));
            }
        }
    }

    protected void btnAddPlot_Click(object sender, EventArgs e)
    {
        string up1 = null;
        string up2 = null;
        string up3 = null;

        uploadPicture1.SaveAs(Server.MapPath("images/") + uploadPicture1.FileName);
        up1 = "~/images/" + uploadPicture1.FileName;

        uploadPicture2.SaveAs(Server.MapPath("images/") + uploadPicture2.FileName);
        up2 = "~/images/" + uploadPicture2.FileName;

        uploadPicture3.SaveAs(Server.MapPath("images/") + uploadPicture3.FileName);
        up3 = "~/images/" + uploadPicture3.FileName;

        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            tblPlot p = new tblPlot();
            p.CityID = Convert.ToInt32(ddlCity.SelectedValue);
            p.PlotTypeID = Convert.ToInt32(ddlType.SelectedValue);
            p.Location = txbLocation.Text;
            p.Area = txbArea.Text;
            p.Price = txbPrice.Text;
            p.PlotDescription = txbDescription.Text;
            p.Contact = txbContact.Text;
            p.Email = txbEmail.Text;
            p.Image1 = up1;
            p.Image2 = up2;
            p.Image3 = up3;
            p.UniqueNum = Convert.ToString(Session["Unique"]);
            p.UploadDate = System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            db.tblPlots.Add(p);
            db.SaveChanges();
        }
    }
}