<%@ Page Title="Register" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="register-form.aspx.cs" Inherits="RailwayTicketingProject.register_form" %>
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
						<li><asp:HyperLink ID="linkregister" NavigateUrl="#register-form.aspx" runat="server" CssClass="active">Register</asp:HyperLink></li>
					</ul>
				</div><!--my-breadcrumb-->
				<div class="my-page-header mt-1 mb-2">
					<h1>Register</h1>
				</div><!--my-page-header-->
			</div><!--col-md-12-->
			<div class="col-md-12">
				<div class="form-card-wrp mb-4">
					<div class="subscribe-wrp-card form-card">
						<h4>Please enter Login Information</h4>
					 <div action="/action_page.php" class="d-flex space-between flex-wrp">
						  <div class="form-group w-100">
                              <asp:TextBox ID="txtusername" CssClass="form-control" placeholder="USERNAME" runat="server"></asp:TextBox> 
                              <asp:Label ID="showmsg" runat="server"></asp:Label> 
							  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Username should be required." ForeColor="Red" ControlToValidate="txtusername" Display="Dynamic"></asp:RequiredFieldValidator>
						    <!--<input type="email" class="form-control" id="email" placeholder="USER NAME">-->
						  </div>
						  <div class="form-group w-49">
							  <asp:TextBox ID="txtpassword" CssClass="form-control" runat="server" placeholder="PASSWORD" TextMode="Password"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password should be required." ControlToValidate="txtpassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
						    <!--<input type="password" class="form-control" id="pwd" placeholder="PASSWORD">-->

						  </div>
						    
						  <div class="form-group w-49">
							  <asp:TextBox ID="txtconfirmpass" CssClass="form-control" runat="server" placeholder="CONFIRM PASSWORD" TextMode="Password"></asp:TextBox>
							  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Confirm Password should be required." ForeColor="Red" ControlToValidate="txtconfirmpass" Display="Dynamic"></asp:RequiredFieldValidator>
                              <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtconfirmpass" Display="Dynamic" ControlToCompare="txtpassword" ErrorMessage="'Confirm Password' and 'Password' do not match." ForeColor="Red"></asp:CompareValidator>
						    <!--<input type="password" class="form-control" id="pwd" placeholder="PASSWORD">-->

						  </div><!--form-group-->

						  <h4 class="w-100 mt-4">Please enter Login Information</h4>

						  <div class="form-group w-49">
                              <asp:TextBox ID="txtfirstname" CssClass="form-control" placeholder="FIRST NAME" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="First Name should be required." ForeColor="Red" ControlToValidate="txtfirstname"></asp:RequiredFieldValidator>
						    <!--<input type="text" class="form-control" id="pwd" placeholder="FIRST NAME">-->
						  </div><!--form-group-->
						  <div class="form-group w-49">
                              <asp:TextBox ID="txtlastname" CssClass="form-control" placeholder="LAST NAME" runat="server"></asp:TextBox>
							  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last Name should be required." ForeColor="Red" ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
						    <!--<input type="text" class="form-control" id="email" placeholder="LAST NAME">-->
						  </div><!--form-group-->

						 <div class="form-group w-49">
                              <asp:TextBox ID="txtmobile" CssClass="form-control" placeholder="MOBILE NUMBER" runat="server"></asp:TextBox>
							  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Display="Dynamic" ErrorMessage="TelePhone Number should be required." ControlToValidate="txtmobile"  ForeColor="Red"></asp:RequiredFieldValidator>
							  <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ControlToValidate="txttelephone" ErrorMessage="Invalid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>  --%>
						    <!--<input type="text" class="form-control" id="email" placeholder="TELEPHONE NUMBER">-->
						  </div><!--form-group-->

						  <div class="form-group w-49">
                              <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="EMAIL ADDRESS" runat="server"></asp:TextBox>
							  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display = "Dynamic" ErrorMessage = "Please enter a valid Email Address"/>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Email Address should be required." ControlToValidate="txtemail"  ForeColor="Red"></asp:RequiredFieldValidator>
						    <!--<input type="text" class="form-control" id="pwd" placeholder="EMAIL ADDRESS">-->
						  </div><!--form-group-->
						  
							
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

						<div class="btn-group">
                            <asp:Button ID="btnsubmit" CssClass="btn btn-orange btn-lg text-uppercase" runat="server" Text="Register" OnClick="btnsubmit_Click" />
							<!--<button class="btn btn-orange btn-lg text-uppercase">Register</button>-->
						</div>
					</div><!--subscribe-wrp-card-->
				</div><!--subscribe-wrp-->
			</div><!--col-md-12-->

		</div>
	</div>
</main><!--inner-wrapper-->
</asp:Content>
