using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["ApnaGhar"] != null)
        {
            Session["AdminID"] = Request.Cookies["ApnaGhar"]["AdminID"];
            Session["FirstName"] = Request.Cookies["ApnaGhar"]["FirstName"];
            Session.Timeout = 720;
            Response.Redirect("Dashboard.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string hash = "code";
        byte[] data = UTF8Encoding.UTF8.GetBytes(txbPassword.Text);
        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
        {
            byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
            using (TripleDESCryptoServiceProvider tripleDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
            {
                ICryptoTransform transform = tripleDes.CreateEncryptor();
                byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                txbPassword.Text = Convert.ToBase64String(results);
            }
        }
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
            var query = db.adminLogin(txbEmail.Text, txbPassword.Text).ToList();
            if (query.Count > 0)
            {
                Session["AdminID"] = query[0].AdminID;
                Session["FirstName"] = query[0].FirstName;
                Session.Timeout = 720;
                Response.Cookies["ApnaGhar"]["AdminID"] = query[0].AdminID.ToString();
                Response.Cookies["ApnaGhar"]["FirstName"] = query[0].FirstName;
                Response.Cookies["ApnaGhar"].Expires = DateTime.Now.AddDays(1);
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Email or Password!";
            }
        }
    }
}