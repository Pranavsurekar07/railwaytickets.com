using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace RailwayTicketingProject
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }
        void RegisterRoutes(RouteCollection Routes)
        {
            Routes.MapPageRoute("UserLogin", "UserLogin", "~/UserLogin.aspx");
            Routes.MapPageRoute("404", "404", "~/404.aspx");
            Routes.MapPageRoute("AddBalance", "AddBalance", "~/add-balance.aspx");
            Routes.MapPageRoute("TicketBooking", "TicketBooking", "~/book-ticket.aspx");
            Routes.MapPageRoute("Cancellations", "Cancellations", "~/cancellations.aspx");
            Routes.MapPageRoute("ContactUs", "ContactUs", "~/contact-us.aspx");
            Routes.MapPageRoute("PaymentFailure", "PaymentFailure", "~/FailurePayment.aspx");
            Routes.MapPageRoute("Feedback", "Feedback", "~/feedback.aspx");
            Routes.MapPageRoute("ForgotPassword", "ForgotPassword", "~/forgot-password.aspx");
            Routes.MapPageRoute("Home", "Home", "~/index.aspx");
            Routes.MapPageRoute("Print", "Print", "~/print-ticket.aspx");
            Routes.MapPageRoute("Register", "Register", "~/register-form.aspx");
            Routes.MapPageRoute("SelectSeats", "SelectSeats", "~/seat-select.aspx");
            Routes.MapPageRoute("PaymentSuccess", "PaymentSuccess", "~/SuccessPayment.aspx");
            Routes.MapPageRoute("TimeTable", "TimeTable", "~/train-timetable.aspx");
            Routes.MapPageRoute("Profile", "Profile", "~/user-profile.aspx");
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}