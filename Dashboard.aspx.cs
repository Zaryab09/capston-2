using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using(ApnaGharEntities db = new ApnaGharEntities())
        {
            var queryAdmin = db.getAdmins().ToList();
            adminCount.InnerText = queryAdmin.Count.ToString();

            var queryCity = db.getCity().ToList();
            cityCount.InnerText = queryCity.Count.ToString();

            var queryType = db.getPropertyType().ToList();
            typeCount.InnerText = queryType.Count.ToString();

            var queryPlot = db.getPlots().ToList();
            plotCount.InnerText = queryPlot.Count.ToString();

            var querySale = db.forSale().ToList();
            saleCount.InnerText = querySale.Count.ToString();

            var queryRent = db.forRent().ToList();
            rentCount.InnerText = queryRent.Count.ToString();
        }
    }
}