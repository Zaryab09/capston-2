using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlotAssessment : System.Web.UI.Page
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
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "CityID";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Select", "0"));

                var queryType = db.getPlotType();
                ddlType.DataSource = queryType;
                ddlType.DataTextField = "PlotType";
                ddlType.DataValueField = "PlotTypeID";
                ddlType.DataBind();
                ddlType.Items.Insert(0, new ListItem("Select", "0"));
            }
        }
    }

    protected void btnPlotAssessment_Click(object sender, EventArgs e)
    {
        if(ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "University Road, Sargodha" && txbArea.Text == "1-5 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 30 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "University Road, Sargodha" && txbArea.Text == "6-10 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 65 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "University Road, Sargodha" && txbArea.Text == "11-15 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 85 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "University Road, Sargodha" && txbArea.Text == "16-20 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 1 CRORE";
        }


        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Nazeer Garden, Sargodha" && txbArea.Text == "1-5 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 26 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Nazeer Garden, Sargodha" && txbArea.Text == "6-10 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 58 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Nazeer Garden, Sargodha" && txbArea.Text == "11-15 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 74 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Nazeer Garden, Sargodha" && txbArea.Text == "16-20 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 87 LAKH";
        }


        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Shaheen Enclave, Sargodha" && txbArea.Text == "1-5 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 22 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Shaheen Enclave, Sargodha" && txbArea.Text == "6-10 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 51 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Shaheen Enclave, Sargodha" && txbArea.Text == "11-15 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 69 LAKH";
        }
        if (ddlCity.SelectedItem.Text == "Sargodha" && ddlType.SelectedItem.Text == "Residential Plot" && txbLocation.Text == "Shaheen Enclave, Sargodha" && txbArea.Text == "16-20 Marla")
        {
            assessmentResult.InnerHtml = "Estimated Cost: PKR 80 LAKH";
        }
    }
}