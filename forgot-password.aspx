<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="RailwayTicketingProject.forgot_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Middle Contain Details-->
    <main class="inner-wrapper mt-5 mb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-card-wrp mb-4">
                        <asp:Panel ID="SendEmailPanel" runat="server">
                            <div class="subscribe-wrp-card userprofile-wrp form-card">

                                <h4>Forgot Password</h4>
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CompareValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <!--<input type="text" class="form-control" id="pwd" placeholder="CONFIRM NEW PASSWORD">-->
                                </div>
                            </div>
                            <!--End if the top user profile-->
                            <div class="btn-group mt-2">
                                <asp:Button ID="btnSend" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="Send" OnClick="btnSend_Click" />
                                <!--<button class="btn btn-orange btn-lg text-uppercase">save changes</button>-->
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="OTPVerifyPanel" runat="server">
                            <div class="subscribe-wrp-card userprofile-wrp form-card">

                                <h4>Forgot Password</h4>
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtVerify" CssClass="form-control" placeholder="Enter OTP" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVerify" ErrorMessage="Please enter OTP to Reset Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <!--<input type="text" class="form-control" id="pwd" placeholder="CONFIRM NEW PASSWORD">-->
                                </div>
                            </div>
                            <!--End if the top user profile-->
                            <div class="btn-group mt-2">
                                <asp:Button ID="btnVerify" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="Verify" OnClick="btnVerify_Click" />
                                <!--<button class="btn btn-orange btn-lg text-uppercase">save changes</button>-->
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="ChangePasswordPanel" runat="server">
                            <h4>Change Password</h4>

                            <div class="topuser-profile d-flex space-between flex-wrp">
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtnewpassword" CssClass="form-control" placeholder="ENTER NEW PASSWORD" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Password" ControlToValidate="txtnewpassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <!--<input type="text" class="form-control" id="email" placeholder="ENTER NEW PASSWORD">-->
                                </div>
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtconfirmnewpassword" CssClass="form-control" placeholder="CONFIRM NEW PASSWORD" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtconfirmnewpassword" ControlToCompare="txtnewpassword" ErrorMessage="Password must be the same" ForeColor="Red"></asp:CompareValidator>
                                    <!--<input type="text" class="form-control" id="pwd" placeholder="CONFIRM NEW PASSWORD">-->
                                </div>
                            </div>
                            <!--End if the top user profile-->

                            <div class="btn-group mt-2">
                                <asp:Button ID="btnsave" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="save password" OnClick="btnsave_Click" />
                                <!--<button class="btn btn-orange btn-lg text-uppercase">save changes</button>-->
                            </div>
                        </asp:Panel>
                    </div>
                    <!--subscribe-wrp-card-->
                </div>
                <!--subscribe-wrp-->
            </div>
            <!--col-md-12-->

        </div>
    </main>
    <!--inner-wrapper-->
</asp:Content>
