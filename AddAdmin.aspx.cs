using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

public partial class AddAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack == false)
        {
            using(ApnaGharEntities db = new ApnaGharEntities())
            {
                if (Request.QueryString["aid"] != null)
                {
                    int Adminid = Convert.ToInt32(Request.QueryString["aid"]);
                    tblAdmin ad = db.tblAdmins.FirstOrDefault(x => x.AdminID == Adminid);
                    if (ad != null)
                    {
                        string hash = "code";
                        byte[] data = Convert.FromBase64String(ad.Password);
                        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
                        {
                            byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                            using (TripleDESCryptoServiceProvider tripleDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                            {
                                ICryptoTransform transform = tripleDes.CreateDecryptor();
                                byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                                ad.Password = UTF8Encoding.UTF8.GetString(results);
                            }
                        }

                        string hash2 = "code";
                        byte[] data2 = Convert.FromBase64String(ad.ConfirmPassword);
                        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
                        {
                            byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                            using (TripleDESCryptoServiceProvider tripleDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                            {
                                ICryptoTransform transform = tripleDes.CreateDecryptor();
                                byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                                ad.ConfirmPassword = UTF8Encoding.UTF8.GetString(results);
                            }
                        }
                        txbFirstname.Text = ad.FirstName;
                        txbLastname.Text = ad.LastName;
                        txbEmail.Text = ad.EmailAddress;
                        ddlAddAdmin.SelectedValue = Convert.ToString(ad.AdminStatus);
                        txbPassword.Attributes["value"] = ad.Password;
                        txbConfirmPassword.Attributes["value"] = ad.ConfirmPassword;
                    }
                }
            }
        }
    }

    protected void btnAddAdmin_Click(object sender, EventArgs e)
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

        string hash2 = "code";
        byte[] data2 = UTF8Encoding.UTF8.GetBytes(txbConfirmPassword.Text);
        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
        {
            byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
            using (TripleDESCryptoServiceProvider tripleDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
            {
                ICryptoTransform transform = tripleDes.CreateEncryptor();
                byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                txbConfirmPassword.Text = Convert.ToBase64String(results);
            }
        }
        using (ApnaGharEntities db = new ApnaGharEntities())
        {
            tblAdmin a = null;
            if (Request.QueryString["aid"] == null)
            {
                var query = db.emailDuplication(txbEmail.Text).ToList();
                if (query.Count > 0)
                {
                    lblDuplication.Text = "Email already registered!";
                    lblMessage.Text = "";
                    return;
                }
            }

            if (Request.QueryString["aid"] != null)
            {
                int AdminID = Convert.ToInt32(Request.QueryString["aid"]);
                a = db.tblAdmins.FirstOrDefault(x => x.AdminID == AdminID);
                var query2 = db.emailDuplication(txbEmail.Text).ToList();
                if (a.EmailAddress == txbEmail.Text)
                {
                    a.EmailAddress = txbEmail.Text;
                    lblMessage.Text = "Admin updated successfully!";
                    lblDuplication.Text = "";
                }
                else if (query2.Count > 0)
                {
                    lblDuplication.Text = "Email already registered!";
                    lblMessage.Text = "";
                    return;
                }
            }
            else
            {
                a = new tblAdmin();
            }
            a.FirstName = txbFirstname.Text; ;
            a.LastName = txbLastname.Text;
            a.EmailAddress = txbEmail.Text;
            a.AdminStatus = Convert.ToBoolean(ddlAddAdmin.SelectedValue);
            a.Password = txbPassword.Text;
            a.ConfirmPassword = txbConfirmPassword.Text;
            if (Request.QueryString["aid"] == null)
            {
                db.tblAdmins.Add(a);
                lblMessage.Text = "Admin saved succssfully!";
            }
            db.SaveChanges();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["aid"] == null)
        {
            Response.Redirect("AddAdmin.aspx");
        }
        if (Request.QueryString["aid"] != null)
        {
            Response.Redirect("ManageAdmin.aspx");
        }
    }
}