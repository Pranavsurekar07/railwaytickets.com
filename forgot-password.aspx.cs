using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Configuration;
using System.Collections.Specialized;

namespace RailwayTicketingProject
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SendEmailPanel.Visible = true;
            OTPVerifyPanel.Visible = false;
            ChangePasswordPanel.Visible = false;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
            parameterList.Add(new Tuple<string, string>("@email", txtEmail.Text));
            var data = SqlDataBind.GetDataByStoredProcedure("usp_CheckEmailExists", "ConnectionString", parameterList);
            if (data.Tables[0].Rows.Count > 0)
            {
                #region
                try
                {
                    Random r = new Random();
                    string otp = r.Next(1000, 9999).ToString();
                    NameValueCollection collection = new NameValueCollection();
                    collection = ConfigurationManager.GetSection("myCredentials") as NameValueCollection;
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    client.EnableSsl = true;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential(collection["email"], collection["password"]);
                    MailMessage msgobj = new MailMessage();
                    msgobj.To.Add(txtEmail.Text);

                    msgobj.From = new MailAddress("pranavsurekar1999@gmail.com");
                    msgobj.Subject = "Forgot Password !!!";
                    msgobj.IsBodyHtml = true;
                    msgobj.Body = "<!doctype html>" +
                                    "<html lang='en-US'>" +
                                    "<head>" +
                                    "<title> Reset Password </title>" +
                                    "<meta name='description' content ='Reset Password Email Template.'>" +
                                    "<style type='text/css'>" +
                                    "a:hover { text - decoration: underline!important; }" +
                                    "</style>" +
                                    "</head>" +
                                    "<body marginheight='0' topmargin='0' marginwidth='0' style='margin: 0px; background-color: #f2f3f8;' leftmargin='0'>" +
                                    "<table cellspacing = '0' border='0' cellpadding='0' width='100%' bgcolor='#f2f3f8'" +
                                    "style='@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: 'Open Sans', sans-serif;'>" +
                                    "<tr>" +
                                    "</td>" +
                                    "<table style='background-color: #f2f3f8; max-width:670px;  margin:0 auto;' width='100%' border='0'" +
                                    "align ='center' cellpadding='0' cellspacing='0'>" +
                                    "<tr>" +
                                    "<td style='height:80px;'> &nbsp;</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                    "<td style='text-align:center;'>" +
                                    "<a href='https://railwayticketing.online' title='logo' target='_blank'>" +
                                           "<img width='60' src='https://i.ibb.co/hL4XZp2/android-chrome-192x192.png' title='logo' alt='logo'>" +
                                    "</a>" +
                                    "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                    "<td style='height:20px;'> &nbsp;</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                    "<td>" +
                                    "<table width='95%' border='0' align='center' cellpadding='0' cellspacing='0'" +
                                "style='max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);'>" +
                                 "<tr>" +
                                    "<td style='height:40px;'>&nbsp;</td>" +
                                     "</tr>" +
                                      "<tr>" +
                                         "<td style='padding:0 35px;'>" +
                                              "<h1 style='color:#1e1e2d; font-weight:500; margin:0;font-size:32px;font-family:'Rubik',sans-serif;'> You have requested to reset your password</h1>" +
                                                   "<span" +
                                            "style='display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;'></span>" +
                                        "<p style='color:#455056; font-size:15px;line-height:24px; margin:0;'>" +
                                        "Hello User,Your OTP is : " + otp +
                                        "</p>" +
                                     "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                    "<td style='height:40px;'> &nbsp;</td>" +
                         "</tr>" +
                                 "</table>" +
                              "</td>" +
                          "<tr>" +
                             "<td style='height:20px;'> &nbsp;</td>" +
                               "</tr>" +
                               "<tr>" +
                                  "<td style='text-align:center;'>" +
                                       "<p style='font-size:14px; color:rgba(69, 80, 86, 0.7411764705882353); line-height:18px; margin:0 0 0;'> &copy; <strong> www.railwayticketing.online </strong></p>" +
                                         "</td>" +
                                  "</tr>" +
                                     "<tr>" +
                                        "<td style='height:80px;'> &nbsp;</td>" +
                                         "</tr>" +
                                     "</table>" +
                                 "</td>" +
                             "</tr>" +
                         "</table>" +
                        "</body>" +
                        "</html>";
                    client.Send(msgobj);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('OTP has been sent successfully');", true);
                    Session["OTP"] = otp.ToString();

                    SendEmailPanel.Visible = false;
                    OTPVerifyPanel.Visible = true;
                }
                catch (Exception ex)
                {

                }
                #endregion
                #region
                //// Replace sender@example.com with your "From" address. 
                //// This address must be verified with Amazon SES.
                //String FROM = "pranavsurekar1999@gmail.com";
                //String FROMNAME = "Railway Ticketing System";

                //// Replace recipient@example.com with a "To" address. If your account 
                //// is still in the sandbox, this address must be verified.
                //String TO = txtEmail.Text;

                //// Replace smtp_username with your Amazon SES SMTP user name.
                //String SMTP_USERNAME = "AKIAQHNNJ4CUCMU6RAFR";

                //// Replace smtp_password with your Amazon SES SMTP password.
                //String SMTP_PASSWORD = "BA6OyziTHhP/rI6m1c2GRWnCoKVLDYg5QwGCSTNcr4Gm";

                //// (Optional) the name of a configuration set to use for this message.
                //// If you comment out this line, you also need to remove or comment out
                //// the "X-SES-CONFIGURATION-SET" header below.
                //String CONFIGSET = "ConfigSet";

                //// If you're using Amazon SES in a region other than US West (Oregon), 
                //// replace email-smtp.us-west-2.amazonaws.com with the Amazon SES SMTP  
                //// endpoint in the appropriate AWS Region.
                //String HOST = "email-smtp.us-east-2.amazonaws.com";

                //// The port you will connect to on the Amazon SES SMTP endpoint. We
                //// are choosing port 587 because we will use STARTTLS to encrypt
                //// the connection.
                //int PORT = 587;

                //// The subject line of the email
                //String SUBJECT =
                //    "Forgot Password !";
                //Random r = new Random();
                //string otp = r.Next(1000, 9999).ToString();
                //// The body of the email
                //String BODY =
                //    "<!doctype html>" +
                //                    "<html lang='en-US'>" +
                //                    "<head>" +
                //                    "< meta content='text/html; charset=utf-8' http-equiv='Content-Type' />" +
                //                    "<title> Reset Password </title>" +
                //                    "<meta name='description' content ='Reset Password Email Template.'>" +
                //                    "<style type='text/css'>" +
                //                    "a:hover { text - decoration: underline!important; }" +
                //                    "</style>" +
                //                    "</head>" +
                //                    "<body marginheight='0' topmargin='0' marginwidth='0' style='margin: 0px; background-color: #f2f3f8;' leftmargin='0'>" +
                //                    "<table cellspacing = '0' border='0' cellpadding='0' width='100%' bgcolor='#f2f3f8'" +
                //                    "style='@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: 'Open Sans', sans-serif;'>" +
                //                    "<tr>" +
                //                    "</td>" +
                //                    "<table style='background-color: #f2f3f8; max-width:670px;  margin:0 auto;' width='100%' border='0'" +
                //                    "align ='center' cellpadding='0' cellspacing='0'>" +
                //                    "<tr>" +
                //                    "<td style='height:80px;'> &nbsp;</td>" +
                //                    "</tr>" +
                //                    "<tr>" +
                //                    "<td style='text-align:center;'>" +
                //                    "<a href='https://railwayticketing.online' title='logo' target='_blank'>" +
                //                           "<img width='60' src='https://i.ibb.co/hL4XZp2/android-chrome-192x192.png' title='logo' alt='logo'>" +
                //                    "</a>" +
                //                    "</td>" +
                //                    "</tr>" +
                //                    "<tr>" +
                //                    "<td style='height:20px;'> &nbsp;</td>" +
                //                    "</tr>" +
                //                    "<tr>" +
                //                    "<td>" +
                //                    "<table width='95%' border='0' align='center' cellpadding='0' cellspacing='0'" +
                //                "style='max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);'>" +
                //                 "<tr>" +
                //                    "<td style='height:40px;'>&nbsp;</td>" +
                //                     "</tr>" +
                //                      "<tr>" +
                //                         "<td style='padding:0 35px;'>" +
                //                              "<h1 style='color:#1e1e2d; font-weight:500; margin:0;font-size:32px;font-family:'Rubik',sans-serif;'> You have requested to reset your password</h1>" +
                //                                   "<span" +
                //                            "style='display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;'></span>" +
                //                        "<p style='color:#455056; font-size:15px;line-height:24px; margin:0;'>" +
                //                        "Hello User,Your OTP is : " + otp +
                //                        "</p>" +
                //                     "</td>" +
                //                 "</tr>" +
                //                 "<tr>" +
                //                    "<td style='height:40px;'> &nbsp;</td>" +
                //         "</tr>" +
                //                 "</table>" +
                //              "</td>" +
                //          "<tr>" +
                //             "<td style='height:20px;'> &nbsp;</td>" +
                //               "</tr>" +
                //               "<tr>" +
                //                  "<td style='text-align:center;'>" +
                //                       "<p style='font-size:14px; color:rgba(69, 80, 86, 0.7411764705882353); line-height:18px; margin:0 0 0;'> &copy; <strong> www.railwayticketing.online </strong></p>" +
                //                         "</td>" +
                //                  "</tr>" +
                //                     "<tr>" +
                //                        "<td style='height:80px;'> &nbsp;</td>" +
                //                         "</tr>" +
                //                     "</table>" +
                //                 "</td>" +
                //             "</tr>" +
                //         "</table>" +
                //        "</body>" +
                //        "</html>";

                //// Create and build a new MailMessage object
                //MailMessage message = new MailMessage();
                //message.IsBodyHtml = true;
                //message.From = new MailAddress(FROM, FROMNAME);
                //message.To.Add(new MailAddress(TO));
                //message.Subject = SUBJECT;
                //message.Body = BODY;
                //// Comment or delete the next line if you are not using a configuration set
                //message.Headers.Add("X-SES-CONFIGURATION-SET", CONFIGSET);

                //using (var client = new System.Net.Mail.SmtpClient(HOST, PORT))
                //{
                //    // Pass SMTP credentials
                //    client.Credentials =
                //        new NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);

                //    // Enable SSL encryption
                //    client.EnableSsl = true;

                //    // Try to send the message. Show status in console.
                //    try
                //    {
                //        Console.WriteLine("Attempting to send email...");
                //        client.Send(message);
                //        Console.WriteLine("Email sent!");
                //        Session["OTP"] = otp.ToString();
                //        SendEmailPanel.Visible = false;
                //        OTPVerifyPanel.Visible = true;
                //    }
                //    catch (Exception ex)
                //    {
                //        Console.WriteLine("The email was not sent.");
                //        Console.WriteLine("Error message: " + ex.Message);
                //    }
                //}
                #endregion
            }
            else
            {
                Response.Write("<script>alert('Entered Email is not registered with us !')</script>");
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {

            if (Session["OTP"].ToString() == txtVerify.Text)
            {
                SendEmailPanel.Visible = false;
                OTPVerifyPanel.Visible = false;
                ChangePasswordPanel.Visible = true;

            }
            else
            {
                SendEmailPanel.Visible = false;
                OTPVerifyPanel.Visible = true;
                Response.Write("<script>alert('Entered OTP is not correct !')</script>");
                ChangePasswordPanel.Visible = false;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            List<Tuple<string, string>> parameterList = new List<Tuple<string, string>>();
            parameterList.Add(new Tuple<string, string>("email", txtEmail.Text));
            parameterList.Add(new Tuple<string, string>("@password", txtconfirmnewpassword.Text));
            var data = SqlDataBind.SaveDataByStoredProcedure("usp_UpdateForgotPassword", "ConnectionString", parameterList);
            if (data > 0)
            {
                Response.Write("<script language='javascript'>window.alert('Password Updated Successfully, Please Login!');window.location='UserLogin.aspx';</script>");
                Session["username"] = null;
                Session.Abandon();
                Response.Redirect("UserLogin.aspx");
            }
        }
    }
}