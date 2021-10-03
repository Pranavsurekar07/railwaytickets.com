<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="train-timetable.aspx.cs" Inherits="RailwayTicketingProject.train_timetable" %>
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
                                <asp:HyperLink ID="linkshoppingcart" CssClass="active" runat="server">Train Time Table</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!--my-breadcrumb-->
                    <div class="my-page-header mt-1 mb-2">
                        <h1>Train Time Table</h1>
                    </div>
                    <!--my-page-header-->
                </div>
                <!--col-md-12-->
                <div class="col-md-12">
                    <div class="table-frame cart-table">
                        <div class="table-responsive">
                            <asp:GridView ID="gvBlog" runat="server" CssClass="table" AutoGenerateColumns="False" OnPageIndexChanging="gvEvents_PageIndexChanging" PageSize="100" DataKeyNames="TrainID" BorderStyle="None" BorderColor="Azure">
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
                                    <asp:TemplateField HeaderText="Date">
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
                                    <asp:TemplateField HeaderText="Distance">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%#Eval("KM") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <!--table-frame-->
                </div>
            </div>
        </div>
    </main>

</asp:Content>
