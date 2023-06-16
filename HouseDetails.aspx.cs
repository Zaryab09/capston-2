using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HouseDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                if (Request.QueryString["vid"] != null)
                {
                    int house = Convert.ToInt32(Request.QueryString["vid"]);
                    tblHouse home = db.tblHouses.FirstOrDefault(x => x.HouseID == house);
                    if (home != null)
                    {
                        image1.ImageUrl = home.Image1;
                        image2.ImageUrl = home.Image2;
                        image3.ImageUrl = home.Image3;
                        dateDetails.InnerHtml = home.UploadDate;
                        cityDetails.InnerHtml = home.tblCity.CityName;
                        typeDetails.InnerHtml = home.tblPropertyType.PropertyType;
                        purposeDetails.InnerHtml = home.Purpose;
                        locationDetails.InnerHtml = home.Location;
                        areaDetails.InnerHtml = home.tblPropertyArea.PropertyArea + "&nbsp;Marla";
                        bedroomDetails.InnerHtml = home.tblBedroom.Bedroom;
                        bathDetails.InnerHtml = home.tblBath.Bath;
                        priceDetails.InnerHtml = home.Price;
                        emailDetails.InnerHtml = home.Email;
                        contactDetails.InnerHtml = home.Contact;
                        descriptionDetails.InnerHtml = home.Description;
                    }
                }
            }
        }
    }

    protected void btnAddToFavourite_Click(object sender, EventArgs e)
    {

    }
}