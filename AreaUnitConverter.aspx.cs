using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AreaUnitConverter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                var queryUnit1 = db.getAreaUnit();
                ddlConvert1.DataSource = queryUnit1;
                ddlConvert1.DataValueField = "AreaUnitID";
                ddlConvert1.DataTextField = "AreaUnit";
                ddlConvert1.DataBind();
                ddlConvert1.Items.Insert(0, new ListItem("Select", "0"));

                var queryUnit2 = db.getAreaUnit();
                ddlConvert2.DataSource = queryUnit2;
                ddlConvert2.DataValueField = "AreaUnitID";
                ddlConvert2.DataTextField = "AreaUnit";
                ddlConvert2.DataBind();
                ddlConvert2.Items.Insert(0, new ListItem("Select", "0"));
            }
        }
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        if(ddlConvert1.SelectedValue == ddlConvert2.SelectedValue)
        {
            txbUnit2.Text = txbUnit1.Text;
        }

        // Marla
        else if(ddlConvert1.SelectedItem.Text == "Marla" && ddlConvert2.SelectedItem.Text == "Kanal")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 0.05);
        }
        else if(ddlConvert1.SelectedItem.Text == "Marla" && ddlConvert2.SelectedItem.Text == "Acre")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 0.00625);
        }
        else if (ddlConvert1.SelectedItem.Text == "Marla" && ddlConvert2.SelectedItem.Text == "Murabba")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 0.00025);
        }

        // Kanal
        else if (ddlConvert1.SelectedItem.Text == "Kanal" && ddlConvert2.SelectedItem.Text == "Marla")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 20);
        }
        else if (ddlConvert1.SelectedItem.Text == "Kanal" && ddlConvert2.SelectedItem.Text == "Acre")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 0.125);
        }
        else if (ddlConvert1.SelectedItem.Text == "Kanal" && ddlConvert2.SelectedItem.Text == "Murabba")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 0.005);
        }

        //Acre
        else if (ddlConvert1.SelectedItem.Text == "Acre" && ddlConvert2.SelectedItem.Text == "Marla")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 160);
        }
        else if (ddlConvert1.SelectedItem.Text == "Acre" && ddlConvert2.SelectedItem.Text == "Kanal")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 8.000000002);
        }
        else if (ddlConvert1.SelectedItem.Text == "Acre" && ddlConvert2.SelectedItem.Text == "Murabba")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 0.04);
        }

        //Murabba
        else if (ddlConvert1.SelectedItem.Text == "Murabba" && ddlConvert2.SelectedItem.Text == "Marla")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 4000.000001);
        }
        else if (ddlConvert1.SelectedItem.Text == "Murabba" && ddlConvert2.SelectedItem.Text == "Kanal")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 200.0000001);
        }
        else if (ddlConvert1.SelectedItem.Text == "Murabba" && ddlConvert2.SelectedItem.Text == "Acre")
        {
            txbUnit2.Text = Convert.ToString(Convert.ToDouble(txbUnit1.Text) * 25);
        }
    }
}