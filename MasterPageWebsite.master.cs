using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageWebsite : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UniqueNum"] != null)
        {
            Session["Unique"] = Request.Cookies["UniqueNum"]["UniqueID"];
            Session.Timeout = 720;
        }
        else
        {
            Response.Cookies["UniqueNum"]["UniqueID"] = DateTime.Now.ToString("MMHHmmss");
            Response.Cookies["UniqueNum"].Expires = DateTime.Now.AddDays(500);
            Session["Unique"] = Request.Cookies["UniqueNum"]["UniqueID"];
        }
    }
}
