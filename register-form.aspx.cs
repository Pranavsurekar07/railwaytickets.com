using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Text;
using System.Security.Cryptography;
using System.Web.DynamicData;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace RailwayTicketingProject
{
    public partial class register_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_CheckUsernameExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", txtusername.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                showmsg.Visible = true;
                showmsg.Text = "UserName Already Taken !";
                showmsg.ForeColor = Color.Red;
                txtusername.Focus();
            }
            else
            {
                showmsg.Visible = false;
                /*string passtosave;
                 byte[] password = UTF8Encoding.UTF8.GetBytes(txtpassword.Text);
                 using(MD5CryptoServiceProvider md5=new MD5CryptoServiceProvider())
                 {
                     byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                     using(TripleDESCryptoServiceProvider tripDes=new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                     {
                         ICryptoTransform transform = tripDes.CreateEncryptor();
                         byte[] results = transform.TransformFinalBlock(password, 0, password.Length);
                         passtosave = Convert.ToBase64String(results, 0, results.Length);
                     }
                 }*/
                List<Tuple<string, string>> parametersList = new List<Tuple<string, string>>();
                parametersList.Add(new Tuple<string, string>("@username", txtusername.Text));
                parametersList.Add(new Tuple<string, string>("@password", txtpassword.Text));
                parametersList.Add(new Tuple<string, string>("@firstname", txtfirstname.Text));
                parametersList.Add(new Tuple<string, string>("@lastname", txtlastname.Text));
                parametersList.Add(new Tuple<string, string>("@mobile", txtmobile.Text));
                parametersList.Add(new Tuple<string, string>("@email", txtemail.Text));
                parametersList.Add(new Tuple<string, string>("@gender",ddlgender.SelectedValue));
                parametersList.Add(new Tuple<string, string>("@address", txtaddress.Text));
                parametersList.Add(new Tuple<string, string>("@currentbalance", "0"));
                var data = SqlDataBind.SaveDataByStoredProcedure("usp_RegisterUserData", "ConnectionString", parametersList);
                if (data > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "success", "alert('Registered Successfully');", true);
                }
                Clear();
            }
        }
        public void Clear()
        {
            txtusername.Text = "";
            txtpassword.Text = "";
            txtconfirmpass.Text = "";
            txtfirstname.Text = "";
            txtlastname.Text = "";
            txtmobile.Text = "";
            txtemail.Text = "";
            ddlgender.SelectedItem.Text ="Gender";
            txtaddress.Text = "";
        }
    }
}