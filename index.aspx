<%@ Page Title="Home" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RailwayTicketingProject.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapes.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="css/style.css" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--- Carousel -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active" id="slider1">
                <img src="Images/slide1.jpg" alt="..." aria-setsize="150" />
                <div class="carousel-caption h5">
                    <h2>Welcome to Indian Railway</h2>
                    <p>Safety | Security | Punchuality</p>
                    <br />
                    <p><a class="btn btn-lg btn-primary" href="register-form.aspx" role="button">Register Today</a></p>
                </div>
            </div>
            <div class="item" id="slider2">
                <img src="Images/slide2.jpg" alt="..." />
                <div class="carousel-caption">
                </div>
            </div>

            <div class="item" id="slider3">
                <img src="Images/slide3.jpg" alt="..." />
                <div class="carousel-caption">
                </div>
            </div>
        </div>
        <!-- Controls -->
        <a class="left2 carousel-control2" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right2 carousel-control2" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!--Carousel-->
    <!--Blog Details-->
    <div class="container">
        <h2 class="main-heading">HOLIDAYS</h2>
        <div class="row">
            <div class="col-sm-6 col-xs-12 col-md-4 col-lg-4 flex50">
                <div class="bloginfo">
                    <div class="upperimg">
                        <span></span>
                        <img src="images/exterior.jpg" alt="maharaja express" />
                    </div>
                    <div class="blogdetail">
                        <h3>Maharaja's Express</h3>
                        <p>Redefining Royalty, Luxury and Comfort, Maharaja’s express takes you on a sojourn to the era of bygone stately splendour of princely states. Sylvan furnishings, elegant ambience and modern amenities are amalgamated for an “Experience Unsurpassed”. It has been a winner of “World’s Leading Luxury train” by World Travel Awards consecutively for last six years.</p>
                        <a href="http://www.the-maharajas.com/" target="_blank" rel="noopener noreferrer" aria-label="More info about Maharaja's Express"><strong>Read More</strong><i class="fa fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12 col-md-4 col-lg-4 flex50">
                <div class="bloginfo">
                    <div class="upperimg">
                        <span></span>
                        <img src="images/Thailand.jpg" alt="International Packages" />
                    </div>
                    <div class="blogdetail">
                        <h3>International Packages</h3>
                        <p>Best deals in International Holiday packages, handpicked by IRCTC, for Thailand, Dubai, Sri Lanka, Hong Kong, China, Macau, Bhutan, Nepal, U.K., Europe, USA, Australia etc. The packages are inclusive of sightseeing, meals, visa charges and overseas medical insurance to give you a hassle-free and memorable experience.</p>
                        <a href="https://www.irctctourism.com/#/tourpacakage_search?searchKey=&amp;tagType=&amp;travelType=International&amp;sector=All" target="_blank" rel="noopener noreferrer"><strong>Read More</strong><i class="fa fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12 col-md-4 col-lg-4 flex50">
                <div class="bloginfo">
                    <div class="upperimg">
                        <span></span>
                        <img src="images/Kashmir.jpg" alt="Domestic Air Packages" />
                    </div>
                    <div class="blogdetail">
                        <h3>Domestic Air Packages</h3>
                        <p>Be it the spiritual devotee seeking blessings of Tirupati, Shirdi or Mata Vaishno Devi or the leisure traveller wanting to relish the Blue mountains of North East, Sand-dunes of Rajasthan, Hamlets of Ladakh, Wonders of Himalayas, Serene lakes or Picturesque Islands, IRCTC has it all. Discover India through IRCTC!</p>
                        <a href="https://www.irctctourism.com/#/tourpacakage_search?searchKey=&amp;tagType=&amp;travelType=Domestic&amp;sector=All" target="_blank" rel="noopener noreferrer"><strong>Read More</strong><i class="fa fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Blog Details End-->
    <!--Advertisement Start-->
    <hr />
    <div class="container center">
        <div class="row">
            <div class="col-lg-4">
                <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/advertisements.xml" Target="_blank" />
            </div>
        </div>
    </div>
    <br />
    <!--Advertisement End-->
</asp:Content>
