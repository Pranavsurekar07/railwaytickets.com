<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="book-ticket.aspx.cs" Inherits="RailwayTicketingProject.book_ticket" %>

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
                                <asp:HyperLink ID="linkbookticket" NavigateUrl="#book-ticket.aspx" runat="server" CssClass="active">Book Ticket</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!--my-breadcrumb-->
                    <div class="my-page-header mt-1 mb-2">
                        <h1>Book Ticket</h1>
                    </div>
                    <!--my-page-header-->
                </div>
                <!--col-md-12-->

                <div class="col-md-12">
                    <div class="form-card-wrp mb-4">
                        <div class="subscribe-wrp-card form-card">
                            <h4>Search for Available Trains</h4>
                            <div action="/action_page.php" class="d-flex space-between flex-wrp">

                                <div class="form-group w-49 custom-arrow">
                                    <asp:DropDownList ID="ddlsource" CssClass="form-control" ClientIDMode="Static" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Source" ControlToValidate="ddlsource" ForeColor="Red" InitialValue="Select Source"> </asp:RequiredFieldValidator>

                                </div>
                                <!--form-group-->

                                <div class="form-group w-49 custom-arrow">
                                    <asp:DropDownList ID="ddldestination" ClientIDMode="Static" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Destination" ControlToValidate="ddldestination" ForeColor="Red" InitialValue="Select Destination"> </asp:RequiredFieldValidator>
                                    
                                </div>
                                <!--form-group-->

                                <div class="form-group w-49 custom-arrow">
                                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate" ErrorMessage="Please Select Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group w-49 custom-arrow">
                                    <asp:DropDownList ID="ddlclass" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Class</asp:ListItem>
                                        <asp:ListItem>General Class</asp:ListItem>
                                        <asp:ListItem>AC First Class</asp:ListItem>
                                        <asp:ListItem>AC 2 tier</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Class" ControlToValidate="ddlclass" ForeColor="Red" InitialValue="0"> </asp:RequiredFieldValidator>
                                </div>
                                <!--form-group-->

                            </div>

                            <div class="btn-group">
                                <asp:Button ID="btnsearch" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                <!--<button class="btn btn-orange btn-lg text-uppercase">Register</button>-->
                            </div>
                        </div>
                        <!--subscribe-wrp-card-->
                    </div>
                    <!--subscribe-wrp-->
                    <div class="x_content">
                        <asp:GridView runat="server" AutoGenerateColumns="False" BorderWidth="0px" BorderColor="#EEEEEE" DataKeyNames="TrainID" ClientIDMode="Static" ID="gvBlog" EmptyDataText="Trains not Avalilable " CssClass="table table-striped table-bordered dt-responsive nowrap" AllowPaging="True" PageSize="100">
                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSrNo" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Train Name">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("TrainName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Source">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("Source") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Destination">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("Destination") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Travel Date">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Arrival Time">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("ArrivalTime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Departure Time">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("DepartureTime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:HyperLinkField DataNavigateUrlFields="TrainID" DataNavigateUrlFormatString="/seat-select.aspx?TrainID={0}" ControlStyle-ForeColor="#3498db" Text="Select" />

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <!--col-md-12-->

            </div>
        </div>
    </main>
    <!--inner-wrapper-->
</asp:Content>
