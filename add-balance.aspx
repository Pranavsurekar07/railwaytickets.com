<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="add-balance.aspx.cs" Inherits="RailwayTicketingProject.add_balance" %>

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
                                <asp:HyperLink ID="linkfeedback" NavigateUrl="#add-balance.aspx" runat="server" CssClass="active">Add Balance</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!--my-breadcrumb-->
                    <div class="my-page-header mt-1 mb-2">
                        <h1>Wallet</h1>
                    </div>
                    <!--my-page-header-->
                </div>


                <div class="col-md-12">
                    <div class="form-card-wrp mb-4">
                        <div class="subscribe-wrp-card userprofile-wrp form-card">
                            <h4>Account Balance</h4>
                            <div class="topuser-profile d-flex space-between flex-wrp">
                                <div class="form-group w-49">
                                    <h4>Balance :
                                   <asp:Label style="margin-left:10%" ID="lblBalance" runat="server" Text="Balance"></asp:Label></h4><br />
                                    <!--<input type="text" class="form-control" id="email" placeholder="ENTER NEW PASSWORD">-->
                                </div>
                                 <div class="w-49">
                                    
                                </div>
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtAddBalance" CssClass="form-control" placeholder="ENTER AMOUNT" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Amount" ControlToValidate="txtAddBalance" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <!--<input type="text" class="form-control" id="email" placeholder="ENTER NEW PASSWORD">-->
                                </div>
                                 <div class="w-49">
                                    
                                </div>
                                <div class="btn-group mt-2">
                                    <input type="hidden" runat="server" id="key" name="key" value="gtKFFx" />
                                    <input type="hidden" runat="server" id="salt" name="salt" value="eCwWELxi" />
                                    <input type="hidden" runat="server" id="hash" name="hash" value="" />
                                    <input type="hidden" runat="server" id="txnid" name="txnid" value="" />
                                    <asp:Button ID="btnAddBalance" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="Add Balance" OnClick="btnaddbalance_Click" />
                                    <!--<button class="btn btn-orange btn-lg text-uppercase">save changes</button>-->
                                </div>
                                    
                            </div>
                            <!--End if the top user profile-->

                        </div>
                        <!--subscribe-wrp-card-->
                    </div>
                    <!--subscribe-wrp-->
                </div>
                <!--col-md-12-->

            </div>
        </div>
    </main>
    <!--inner-wrapper-->
</asp:Content>
