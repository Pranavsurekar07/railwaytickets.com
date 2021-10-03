<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="RailwayTicketingProject.contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="contactus-mainwrap mt-5 mb-5">
            <div class="container">
                <div class="contactus-innerwrap">
                    <div class="my-breadcrumb">
                        <ul>
                            <li>Home</li>
                            <li>
                                <asp:HyperLink ID="HyperLink1" CssClass="active" NavigateUrl="#Contact-Us" runat="server">Contact Us</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!--End of the my breadcrumb-->
                    <div class="my-page-header mt-1 mb-2">
                        <h1>Contact Us</h1>
                    </div>
                    <!--End of the my page header-->

                    <div class="contactus-paratxt">
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink3" CssClass="active" NavigateUrl="~/feedback.aspx" runat="server">Give us feedback</asp:HyperLink></li>
                        </ul>
                        <p class="contact-para">For all enquiries, kindly email us at <a href="https://mail.google.com/mail/?view=cm&fs=1&to=pranavsurekar00@gmail.com" target="_blank">pranavsurekar00@gmail.com</a></p>
                    </div>
                    <!--End of the contact us para txt-->

                    <div class="contactus-boxwrap mt-4 mb-4">
                        <div class="contactus-innerbox">
                            <div class="leftcontact-addrwrap">
                                <div class="leftcontact-wrap">
                                    <div class="individualcontact-box">
                                        <div class="individualcontact-innerbox">
                                            <h5 class="contact-head">Railway Zones and Headquarters</h5>

                                            <div class="contact-individaddr">
                                                <h6 class="addr-head mt-2">Zone: Central</h6>
                                                <h6 class="addr-head mt-2">Mumbai</h6>
                                                <p>
                                                    Division: Mumbai(CST), Bhusawal, Nagpur, Pune
                                                    <br />
                                                    Mumbai - 400051
                                                </p>
                                                <div class="taxfax-div mt-2">
                                                    <p class="tax-txt">
                                                        <span class="redtxt">T:</span>
                                                        <span class="blacktxt">+91 22 4000 1700
                                                        </span>
                                                    </p>
                                                    <p class="fax-txt">
                                                        <span class="redtxt">F:</span>
                                                        <span class="blacktxt">+91 22 4000 1701</span>
                                                    </p>
                                                    <hr />
                                                </div>
                                                <!--End ofthe tax fax div-->

                                            </div>
                                            <!--End of the contact individ addr-->

                                            <div class="contact-individaddr">
                                                <h6 class="addr-head mt-2">Zone: Western</h6>
                                                <h6 class="addr-head mt-2">Mumbai</h6>
                                                <p>
                                                    Division: Mumbai(Central),Vadodara, Ratlam,Ahmedabad,Rajkot, Bhavnagar
                                                    <br />
                                                    Mumbai - 400052
                                                </p>
                                                <div class="taxfax-div mt-2">
                                                    <p class="tax-txt">
                                                        <span class="redtxt">T:</span>
                                                        <span class="blacktxt">+91 22 4000 1701
                                                        </span>
                                                    </p>
                                                    <p class="fax-txt">
                                                        <span class="redtxt">F:</span>
                                                        <span class="blacktxt">+91 22 4000 1702</span>
                                                    </p>
                                                    <hr />
                                                </div>
                                                <!--End ofthe tax fax div-->

                                            </div>
                                            <!--End of the contact individ addr-->
                                            <div class="contact-individaddr">
                                                <h6 class="addr-head mt-2">Zone: Northern</h6>
                                                <h6 class="addr-head mt-2">Delhi</h6>
                                                <p>
                                                    Division: Ambala, Delhi, Lucknow, Moradabad, Ferozpur
                                                    <br />
                                                    Mumbai - 400053
                                                </p>
                                                <div class="taxfax-div mt-2">
                                                    <p class="tax-txt">
                                                        <span class="redtxt">T:</span>
                                                        <span class="blacktxt">+91 22 4000 1703
                                                        </span>
                                                    </p>
                                                    <p class="fax-txt">
                                                        <span class="redtxt">F:</span>
                                                        <span class="blacktxt">+91 22 4000 1703</span>
                                                    </p>
                                                    <hr />
                                                </div>
                                                <!--End ofthe tax fax div-->

                                            </div>
                                            <!--End of the contact individ addr-->
                                            <div class="contact-individaddr">
                                                <h6 class="addr-head mt-2">Zone: Eastern</h6>
                                                <h6 class="addr-head mt-2">Kolkata</h6>
                                                <p>
                                                    Division: Asansol, Howrah, Malda, Sealdah
                                                    <br />
                                                    Mumbai - 400054
                                                </p>
                                                <div class="taxfax-div mt-2">
                                                    <p class="tax-txt">
                                                        <span class="redtxt">T:</span>
                                                        <span class="blacktxt">+91 22 4000 1704
                                                        </span>
                                                    </p>
                                                    <p class="fax-txt">
                                                        <span class="redtxt">F:</span>
                                                        <span class="blacktxt">+91 22 4000 1704</span>
                                                    </p>
                                                    <hr />
                                                </div>
                                                <!--End ofthe tax fax div-->

                                            </div>
                                            <!--End of the contact individ addr-->
                                            <div class="contact-individaddr">
                                                <h6 class="addr-head mt-2">Zone: Southern</h6>
                                                <h6 class="addr-head mt-2">Chennai</h6>
                                                <p>
                                                    Division: Chennai, Madurai, Palghat, Trichy, Trivandrum, Salem
                                                    <br />
                                                    Mumbai - 400055
                                                </p>
                                                <div class="taxfax-div mt-2">
                                                    <p class="tax-txt">
                                                        <span class="redtxt">T:</span>
                                                        <span class="blacktxt">+91 22 4000 1705
                                                        </span>
                                                    </p>
                                                    <p class="fax-txt">
                                                        <span class="redtxt">F:</span>
                                                        <span class="blacktxt">+91 22 4000 1705</span>
                                                    </p>
                                                    <hr />
                                                </div>
                                                <!--End ofthe tax fax div-->

                                            </div>
                                            <!--End of the contact individ addr-->
                                            <div class="contact-individaddr">
                                                <h6 class="addr-head mt-2">Zone: East Central</h6>
                                                <h6 class="addr-head mt-2">Hajipur</h6>
                                                <p>
                                                    Division: Danapur, Dhanbad, Mughalsarai, Samastipur, Sonpur
                                                    <br />
                                                    Mumbai - 400056
                                                </p>
                                                <div class="taxfax-div mt-2">
                                                    <p class="tax-txt">
                                                        <span class="redtxt">T:</span>
                                                        <span class="blacktxt">+91 22 4000 1706
                                                        </span>
                                                    </p>
                                                    <p class="fax-txt">
                                                        <span class="redtxt">F:</span>
                                                        <span class="blacktxt">+91 22 4000 1706</span>
                                                    </p>
                                                    <hr />
                                                </div>
                                                <!--End ofthe tax fax div-->

                                            </div>
                                            <!--End of the contact individ addr-->
                                        </div>
                                        <!--End of the individual contact innerbox-->
                                    </div>
                                    <!--End of the individual contact box-->


                                </div>
                                <!--End of the left contact wrap-->
                            </div>
                            <!--End of the keft contact add wrap-->
                            <%-- <div class="rightcontact-map">
                     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15084.02965301651!2d72.85185606805628!3d19.063411674523646!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c8df0b86ea1b%3A0xce7eea4b1bbdf296!2sBandra%20Kurla%20Complex%2C%20Bandra%20East%2C%20Mumbai%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1589964764567!5m2!1sen!2sin" class="contactmap-frame" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                     </div><!--End of the right contact map-->--%>
                        </div>
                        <!--End of the contact us inner box-->
                    </div>
                    <!--end of the contact us box wrap-->
                </div>
                <!--End of the contact us inner wrap-->
            </div>
            <!--End of the container-->
        </div>
        <!--End of the contact us main wrapper-->
    </main>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

    <script>
        $(".leftcontact-wrap").mCustomScrollbar({

        });
    </script>
</asp:Content>
