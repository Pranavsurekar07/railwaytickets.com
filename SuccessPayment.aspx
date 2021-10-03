<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="SuccessPayment.aspx.cs" Inherits="RailwayTicketingProject.SuccessPayment" %>
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
                            <li>Add Balance</li>
                            <li>
                                <asp:HyperLink ID="linkfeedback" NavigateUrl="#SuccessPayment.aspx" runat="server" CssClass="active">Success Payment</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!--my-breadcrumb-->
                    <div class="my-page-header mt-1 mb-2">
                        <h1>Payment Status</h1>
                    </div>
                    <!--my-page-header-->
                </div>
                <div class="col-md-12">
                    <div class="form-card-wrp mb-4">
                        <div class="subscribe-wrp-card userprofile-wrp form-card">
                            <h4><a href="add-balance.aspx">Return To Wallet</a> </h4>
                            <div class="topuser-profile d-flex space-between flex-wrp">
                               <h3><asp:Label CssClass="text-center" runat="server" ID="lbltransaction"></asp:Label></h3>
                                  
							
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
