using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            using (ApnaGharEntities db = new ApnaGharEntities())
            {
                var queryLink = db.getCity();
                GVplots.DataSource = queryLink;
                GVplots.DataBind();

                GVsale.DataSource = queryLink;
                GVsale.DataBind();

                GVrent.DataSource = queryLink;
                GVrent.DataBind();

                var queryPropertyType = db.getPropertyType();
                ddlPropertyType.DataSource = queryPropertyType;
                ddlPropertyType.DataTextField = "PropertyType";
                ddlPropertyType.DataValueField = "TypeID";
                ddlPropertyType.DataBind();
                ddlPropertyType.Items.Insert(0, new ListItem("Select", "0"));

                var queryPropertyArea = db.getPropertyArea();
                ddlPropertyArea.DataSource = queryPropertyArea;
                ddlPropertyArea.DataTextField = "PropertyArea";
                ddlPropertyArea.DataValueField = "AreaID";
                ddlPropertyArea.DataBind();
                ddlPropertyArea.Items.Insert(0, new ListItem("Select", "0"));

                var queryCity = db.getCity();
                ddlCity.DataSource = queryCity;
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "CityID";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Select", "0"));

                ddlPurpose.Items.Insert(0, new ListItem("Select", "0"));

                var queryCityPlot = db.getCity();
                ddlPlotCity.DataSource = queryCityPlot;
                ddlPlotCity.DataValueField = "CityID";
                ddlPlotCity.DataTextField = "CityName";
                ddlPlotCity.DataBind();
                ddlPlotCity.Items.Insert(0, new ListItem("Select", "0"));

                var queryPlotType = db.getPlotType();
                ddlPlotType.DataSource = queryPlotType;
                ddlPlotType.DataValueField = "PlotTypeID";
                ddlPlotType.DataTextField = "PlotType";
                ddlPlotType.DataBind();
                ddlPlotType.Items.Insert(0, new ListItem("Select", "0"));
            }
        }
    }

    protected void GVplots_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "explorePlot")
        {
            Response.Redirect("QuickLinksPlot.aspx?pcid=" + e.CommandArgument);
        }
    }

    protected void GVsale_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "exploreSale")
        {
            Response.Redirect("QuickLinks.aspx?sid=" + e.CommandArgument);
        }
    }

    protected void GVrent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "exploreRent")
        {
            if (e.CommandName == "exploreRent")
            {
                Response.Redirect("QuickLinksRent.aspx?rid=" + e.CommandArgument);
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
            var query = db.storeSrch(ddlPurpose.SelectedValue, txbLocation.Text, ddlCity.SelectedItem.Text, ddlPropertyType.SelectedItem.Text, ddlPropertyArea.SelectedItem.Text).ToList();
            if (query.Count > 0)
            {
                GVsearchresult.DataSource = query;
                GVsearchresult.DataBind();
                H3message.InnerHtml = "";
            }
            else
            {
                H3message.InnerHtml = "No matching property found!";
                GVsearchresult.DataSource = null;
                GVsearchresult.DataBind();
            }
        }
    }

    protected void GVsearchresult_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewDetails")
        {
            Response.Redirect("HouseDetails.aspx?vid=" + e.CommandArgument);
        }
    }

    protected void btnPlotSearch_Click(object sender, EventArgs e)
    {
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
            var queryPlotResult = db.storeSrchPlot(txbPlotLocation.Text, ddlPlotCity.SelectedItem.Text, ddlPlotType.SelectedItem.Text, txbPlotArea.Text).ToList();
            if (queryPlotResult.Count > 0)
            {
                GVplotResult.DataSource = queryPlotResult;
                GVplotResult.DataBind();
                noPlotMessage.InnerHtml = "";
            }
            else
            {
                noPlotMessage.InnerHtml = "No matching plots found!";
                GVplotResult.DataSource = null;
                GVplotResult.DataBind();
            }
        }
    }


    protected void GVplotResult_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewDetails")
        {
            Response.Redirect("PlotDetails.aspx?pid=" + e.CommandArgument);
        }
    }
}