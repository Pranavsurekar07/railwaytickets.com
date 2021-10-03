<%--<%@ Page Title="Login" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="RailwayTicketingProject.UserLogin" %>--%>
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
                            <asp:HyperLink ID="linklogin" NavigateUrl="#login.aspx" CssClass="active" runat="server">Login</asp:HyperLink></li>
					</ul>
				</div><!--my-breadcrumb-->
				<div class="my-page-header mt-1 mb-2">
					<h1>Login to have the best train ticketing booking experience.</h1>
				</div><!--my-page-header-->
				<div class="date-name-wrp mb-5">
					<ul>
						<li><span id="currentdate"></span></li>
						<li>|</li>
						<li>Rail Exp.</li>
					</ul>
				</div><!--date-name-wrp-->
			</div><!--col-md-12-->

			<div class="col-md-8 left-contain">
				<%--<h4 class="sub-heading mb-4">India Ratings and Research (Ind-Ra) has affirmed Associated Engineering Enterprises’
				(AEE) Long-Term Issuer Rating at 'IND B+'. The Outlook is Stable.
				The instrument-wise rating actions are given below: </h4>--%>

				<div class="login-screen">
					<div class="login-screen-card form-card">
						<h4>Please enter login detail</h4>
					<!-- <form action="/action_page.php">-->
						  <div class="form-group">
                              <asp:TextBox ID="txtusername" CssClass="form-control" placeholder="USERNAME" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Username" ForeColor="Red" ControlToValidate="txtusername"></asp:RequiredFieldValidator>
						    <!--<input type="email" class="form-control" id="email" placeholder="USER NAME">-->
						  </div>
						  <div class="form-group">
							  <asp:TextBox ID="txtpassword" CssClass="form-control" placeholder="PASSWORD" runat="server" TextMode="Password"></asp:TextBox>
							  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Password" ForeColor="Red" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
						    <!--<input type="password" class="form-control" id="pwd" placeholder="PASSWORD">-->
						  </div>
						  <div class="checkbox">
						    <label><asp:CheckBox ID="checkrememberme1" runat="server" /> <span>Remember me</span></label>
						  </div>
                         <asp:Button ID="btnsubmit" CssClass="btn btn-orange w-100 height-55" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
						  <!--<button type="submit" class="btn btn-orange w-100 height-55">Submit</button>-->
							<div class="forgot-links mt-2">
                                <a href="forgot-password.aspx">Forgot Password?</a>
								
						  	<span>|</span>
                                <asp:HyperLink ID="linksignup" NavigateUrl="~/register-form.aspx" runat="server">Not Registered? Sign Up Here</asp:HyperLink>
						  	
							</div>
						<!--</form>-->
					</div>
				</div><!--login-screen-->

			</div><!--col-md-8-->		

		</div>
	</div>
</main><!--inner-wrapper-->
	<script type="text/javascript">
		function getDate() {
			var dt = new Date();
			var element = document.getElementById("currentdate");
			element.innerHTML = dt.toDateString();
        }
	</script>
</asp:Content>
