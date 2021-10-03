<%@ Page Title="Profile" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" EnableEventValidation="false" Inherits="RailwayTicketingProject.user_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--Middle Contain Details-->
<main class="inner-wrapper mt-5 mb-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="form-card-wrp mb-4">
					<div class="subscribe-wrp-card userprofile-wrp form-card">
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
                             </div><!--End if the top user profile-->
                         </asp:Panel>
                         <asp:Panel ID="UserProfilePanel" runat="server">
							 <h4 class="mt-3 personaldeat-head">Your personal detail</h4>
                             
                         <div class="userprofile-form d-flex space-between flex-wrp">
						  <div class="form-group w-49">
                            <label class="userprofile-lab">FIRST NAME:</label> 							  
							  <asp:TextBox ID="txtfirstname" CssClass="form-control firstname" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter First Name" ControlToValidate="txtfirstname" ForeColor="Red"></asp:RequiredFieldValidator>
						    <!--<input type="text" class="form-control firstname" id="name" value="raj" placeholder="">-->
						  </div>
						  <div class="form-group w-49">
                            <label class="userprofile-lab">LAST NAME:</label>  
							  <asp:TextBox ID="txtlastname" CssClass="form-control lastname" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Last Name" ControlToValidate="txtlastname" ForeColor="Red"></asp:RequiredFieldValidator>
						    <!--<input type="text" class="form-control lastname" id="lname" value="sharma" placeholder="">-->
						  </div>
						   <div class="form-group w-49">
							   <label class="userprofile-lab">MOBILE NUMBER:</label>  
                              <asp:TextBox ID="txtmobile" CssClass="form-control emailid" placeholder="MOBILE NUMBER" runat="server"></asp:TextBox>
							  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Display="Dynamic" ErrorMessage="TelePhone Number should be required." ControlToValidate="txtmobile"  ForeColor="Red"></asp:RequiredFieldValidator>
						    <!--<input type="text" class="form-control" id="email" placeholder="TELEPHONE NUMBER">-->
						  </div><!--form-group-->
						  <div class="form-group w-49">
                            <label class="userprofile-lab">EMAIL ADDRESS :</label>  
							  <asp:TextBox ID="txtemail" CssClass="form-control emailid" runat="server"></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display = "Dynamic" ErrorMessage = "Invalid email address"/>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter E-mail" ControlToValidate="txtemail"  ForeColor="Red"></asp:RequiredFieldValidator>
						    <!--<input type="text" class="form-control emailid" id="email" value="raj@gmail.com" placeholder="">-->
						  </div>
						   <div class="form-group w-49 custom-arrow">
                              <asp:DropDownList ID="ddlgender" CssClass="form-control" runat="server">
                                  <asp:ListItem>Gender</asp:ListItem>
                                  <asp:ListItem>Male</asp:ListItem>
                                  <asp:ListItem>Female</asp:ListItem>
                                  <asp:ListItem>Transgender</asp:ListItem>

                              </asp:DropDownList>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Gender" ControlToValidate="ddlgender" ForeColor="Red" InitialValue="Gender"> </asp:RequiredFieldValidator>
							</div><!--form-group-->

							<div class="form-group w-100">
                              <asp:TextBox ID="txtaddress" Rows="5" CssClass="form-control" placeholder="ADDRESS" TextMode="MultiLine" runat="server"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Address should be required." ControlToValidate="txtaddress" ForeColor="Red"> </asp:RequiredFieldValidator>
								<!--<textarea class="form-control mytextarea" placeholder="ADDRESS"</textarea>-->
							</div><!--form-group-->
							 </div>
                         </asp:Panel>
						<div class="btn-group mt-2">
                            <asp:Button ID="btnsave" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="save changes" OnClick="btnsave_Click" />
							<!--<button class="btn btn-orange btn-lg text-uppercase">save changes</button>-->
						</div>
					</div><!--subscribe-wrp-card-->
				</div><!--subscribe-wrp-->
			</div><!--col-md-12-->

		</div>
	</div>
</main><!--inner-wrapper-->
</asp:Content>
