using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlotDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            if (Request.QueryString["pid"] != null)
            {
                int plot_id = Convert.ToInt32(Request.QueryString["pid"]);
                tblPlot plots = db.tblPlots.FirstOrDefault(x => x.PlotID == plot_id);
                if (plots != null)
                {
                    image1.ImageUrl = plots.Image1;
                    image2.ImageUrl = plots.Image2;
                    image3.ImageUrl = plots.Image3;
                    dateDetails.InnerHtml = plots.UploadDate;
                    cityDetails.InnerHtml = plots.tblCity.CityName;
                    typeDetails.InnerHtml = plots.tblPlotType.PlotType;
                    locationDetails.InnerHtml = plots.Location;
                    areaDetails.InnerHtml = plots.Area;
                    priceDetails.InnerHtml = plots.Price;
                    emailDetails.InnerHtml = plots.Email;
                    contactDetails.InnerHtml = plots.Contact;
                    descriptionDetails.InnerHtml = plots.PlotDescription;
                }
            }
        }
    }

    protected void btnAddToFavourite_Click(object sender, EventArgs e)
    {
        Response.Redirect("");
    }
}