<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="seat-select.aspx.cs" Inherits="RailwayTicketingProject.seat_select" %>

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
                            <li>Book Ticket</li>
                            <li>
                                <asp:HyperLink ID="linkbookticket" NavigateUrl="#seat-select.aspx" runat="server" CssClass="active">Select Seats</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!--my-breadcrumb-->
                    <div class="my-page-header mt-1 mb-2">
                        <h1>Select Seats/Passenger Details</h1>
                    </div>
                    <!--my-page-header-->
                </div>
                <!--col-md-12-->
                <div class="col-md-12">
                    <div class="form-card-wrp mb-4">
                        <div class="subscribe-wrp-card form-card">
                            <h4>Train Details</h4>
                            <div action="/action_page.php" class="d-flex space-between flex-wrp">
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Train Number:</label>
                                    <asp:TextBox ID="txtTrainNumber" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Train Name:</label>
                                    <asp:TextBox ID="txtTrainName" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Class:</label>
                                    <asp:TextBox ID="txtClass" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Source:</label>
                                    <asp:TextBox ID="txtSource" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Destination:</label>
                                    <asp:TextBox ID="txtDestination" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Journey Date:</label>
                                    <asp:TextBox ID="txtJourneyDate" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Departure Time:</label>
                                    <asp:TextBox ID="txtDepartureTime" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Arrival Time:</label>
                                    <asp:TextBox ID="txtArrivalTime" CssClass="form-control firstname" runat="server" Enabled="False"></asp:TextBox>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                               
                                
                            </div>
                        </div>
                        <!--subscribe-wrp-card-->
                    </div>
                    <div class="form-card-wrp mb-4">
                        <div class="subscribe-wrp-card form-card">
                            <h4>Enter Passenger Information</h4>
                            <div action="/action_page.php" class="d-flex space-between flex-wrp">
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Passenger Name:</label>
                                    <asp:TextBox ID="txtName" CssClass="form-control firstname" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName" ForeColor="Red"> </asp:RequiredFieldValidator>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Age:</label>
                                    <asp:TextBox ID="txtAge" CssClass="form-control firstname" TextMode="Number" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Age" ControlToValidate="txtAge" ForeColor="Red"> </asp:RequiredFieldValidator>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="form-group w-49">
                                    <label class="userprofile-lab">Gender:</label>
                                    <asp:DropDownList ID="ddlgender" CssClass="form-control" runat="server">
                                        <asp:ListItem>Select Gender</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Transgender</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Gender" ControlToValidate="ddlgender" ForeColor="Red" InitialValue="Select Gender"> </asp:RequiredFieldValidator>
                                </div>
                                 <div class="form-group w-49">
                                    <label class="userprofile-lab">No. Of Passengers:</label>
                                    <asp:TextBox ID="txtNoOfPassengers" TextMode="Number" CssClass="form-control firstname" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter No. of Passengers" ControlToValidate="txtNoOfPassengers" ForeColor="Red"> </asp:RequiredFieldValidator>
                                    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
                                </div>
                                <div class="btn-group">
                                    <asp:Button ID="btnNext" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="Book Ticket" OnClick="btnNext_Click" />
                                    <!--<button class="btn btn-orange btn-lg text-uppercase">Register</button>-->
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--   <div class="x_content">
                        <asp:GridView runat="server" AutoGenerateColumns="False" BorderWidth="0px" BorderColor="#EEEEEE" ClientIDMode="Static" ID="gvBlog" EmptyDataText="Please Select No of Passengers" CssClass="table table-striped table-bordered dt-responsive nowrap" AllowPaging="True" PageSize="100">
                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtName" runat="server" placeholder="Name"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Age">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtAge" runat="server" placeholder="Age"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlgender" CssClass="form-control" runat="server">
                                            <asp:ListItem>Gender</asp:ListItem>
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                            <asp:ListItem>Transgender</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Gender" ControlToValidate="ddlgender" ForeColor="Red" InitialValue="Gender"> </asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Train Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTrainNo" runat="server" Text="Train Number"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>--%>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
