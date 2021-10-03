<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="cancellations.aspx.cs" Inherits="RailwayTicketingProject.cancellations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Middle Contain Details-->
    <main class="inner-wrapper mt-5 mb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="my-breadcrumb">
                        <ul>
                            <li>Home</li>
                            <li>
                                <asp:HyperLink ID="linkfeedback" NavigateUrl="#cancellations.aspx" runat="server" CssClass="active">Cancellations</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!--my-breadcrumb-->
                    <div class="my-page-header mt-1 mb-2">
                        <h1>Cancel Ticket</h1>
                    </div>
                    <!--my-page-header-->
                </div>
                <!--col-md-12-->
                <div class="col-md-12">
                    <div class="form-card-wrp mb-4">
                        <div class="subscribe-wrp-card form-card feedback-form-wrp">
                            <div class="d-flex space-between feedback-frmwrp flex-wrp mt-4">
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtTicketNumber" CssClass="form-control" placeholder="TICEKT NUMBER" runat="server"></asp:TextBox>

                                    <!--<input type="text" class="form-control" id="email" placeholder="ENTER NEW PASSWORD">-->
                                </div>

                                <div class="w-49">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Ticket Number" ControlToValidate="txtTicketNumber" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="btn-group mt-2">
                                    <asp:Button ID="btnview" CssClass="btn btn-orange btn-lg text-uppercase feedback-subbtn" runat="server" Text="View Ticket" OnClick="btnView_Click" />
                                </div>
                            </div>
                            <asp:Panel ID="CancelTktPanel" runat="server">
                                 <div class="btn-group mt-2" style="margin-left:45%">
                                        <h3>PNR Details</h3>
                                    </div>
                                <div class="P2Container" style="margin-top: 5px; border:2px solid">
                                    <div class="Section2-first-column-flex">
                                        <p>Ticket Number:
                                            <asp:Label runat="server" ID="lblPNRNumber"></asp:Label></p>
                                        <p>Name:
                                            <asp:Label runat="server" ID="lblName"></asp:Label></p>
                                        <p>Source:
                                            <asp:Label runat="server" ID="lblSource"></asp:Label></p>
                                        <p>Journey Date:
                                            <asp:Label runat="server" ID="lblJourneyDate"></asp:Label></p>
                                        <p>Departure Time:
                                            <asp:Label runat="server" ID="lblDepartureTime"></asp:Label></p>
                                        <p>Class Type: <asp:Label runat="server" ID="lblClassType"></asp:Label></p>
                                        <p>Status: <asp:Label runat="server" ID="lblStatus"></asp:Label></p>
                                    </div>
                                    <div class="Section2-second-column-flex">
                                        <p>Train Name:
                                            <asp:Label runat="server" ID="lblTrainName"></asp:Label></p>
                                        <p>Booking Date:
                                            <asp:Label runat="server" ID="lblDate"></asp:Label></p>
                                        <p>Train Number:
                                            <asp:Label runat="server" ID="lblTrainNumber"></asp:Label></p>
                                        <p>Destination:
                                            <asp:Label runat="server" ID="lblDestination"></asp:Label></p>
                                        <p>Arrival Time: <asp:Label runat="server" ID="lblArrivalTime"></asp:Label></p>
                                        <p>Total Seats: <asp:Label runat="server" ID="lblTotalSeats"></asp:Label></p>
                                        
                                        <p>Total Fare:
                                            <asp:Label runat="server" ID="lblTotalFare"></asp:Label></p>
                                        
                                    </div>
                                   
                                </div>
                                 <div class="btn-group mt-2" style="margin-left:45%">
                                        <asp:Button ID="btnCancel" CssClass="btn btn-orange btn-md text-uppercase" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                        <!--<button class="btn btn-orange btn-lg text-uppercase feedback-subbtn">submit</button>-->
                                    </div>
                            </asp:Panel>
                           
                        </div>
                        <!--subscribe-wrp-card-->
                    </div>
                    <!--subscribe-wrp-->
                </div>
                <!--col-md-12-->
            </div>
        </div>
    </main>
</asp:Content>
