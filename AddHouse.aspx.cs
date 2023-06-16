using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddHouse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                var queryCity = db.getCity();
                ddlCity.DataSource = queryCity;
                ddlCity.DataValueField = "CityID";
                ddlCity.DataTextField = "CityName";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Select", "0"));

                var queryType = db.getPropertyType();
                ddlType.DataSource = queryType;
                ddlType.DataValueField = "TypeID";
                ddlType.DataTextField = "PropertyType";
                ddlType.DataBind();
                ddlType.Items.Insert(0, new ListItem("Select", "0"));

                var queryArea = db.getPropertyArea();
                ddlArea.DataSource = queryArea;
                ddlArea.DataValueField = "AreaID";
                ddlArea.DataTextField = "PropertyArea";
                ddlArea.DataBind();
                ddlArea.Items.Insert(0, new ListItem("Select", "0"));

                var queryBedroom = db.getBedroom();
                ddlBedroom.DataSource = queryBedroom;
                ddlBedroom.DataValueField = "BedroomID";
                ddlBedroom.DataTextField = "Bedroom";
                ddlBedroom.DataBind();
                ddlBedroom.Items.Insert(0, new ListItem("Select", "0"));

                var queryBath = db.getBath();
                ddlBath.DataSource = queryBath;
                ddlBath.DataValueField = "BathID";
                ddlBath.DataTextField = "Bath";
                ddlBath.DataBind();
                ddlBath.Items.Insert(0, new ListItem("Select", "0"));

                ddlPurpose.Items.Insert(0, new ListItem("Select", "Select"));
            }
        }
    }

    protected void btnAddProperty_Click(object sender, EventArgs e)
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
            tblHouse h = new tblHouse();
            h.CityID = Convert.ToInt32(ddlCity.SelectedValue);
            h.TypeID = Convert.ToInt32(ddlType.SelectedValue);
            h.Purpose = ddlPurpose.SelectedValue;
            h.Location = txbLocation.Text;
            h.AreaID = Convert.ToInt32(ddlArea.SelectedValue);
            h.BedroomID = Convert.ToInt32(ddlBedroom.SelectedValue);
            h.BathID = Convert.ToInt32(ddlBath.SelectedValue);
            h.Price = txbPrice.Text;
            h.Description = txbDescription.Text;
            h.Contact = txbContact.Text;
            h.Email = txbEmail.Text;
            h.UniqueNum = Convert.ToString(Session["Unique"]);
            h.UploadDate = System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            h.Image1 = up1;
            h.Image2 = up2;
            h.Image3 = up3;
            db.tblHouses.Add(h);
            db.SaveChanges();
        }
    }
}