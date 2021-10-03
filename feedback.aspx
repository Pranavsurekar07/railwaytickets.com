<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="RailwayTicketingProject.feedback" %>
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
						<li><asp:HyperLink ID="linkfeedback" NavigateUrl="#feedback.aspx" runat="server" CssClass="active">Feedback</asp:HyperLink></li>
					</ul>
				</div><!--my-breadcrumb-->
				<div class="my-page-header mt-1 mb-2">
					<h1>Feedback</h1>
				</div><!--my-page-header-->
			</div><!--col-md-12-->
			<div class="col-md-12">
				<div class="form-card-wrp mb-4">
					 <div class="subscribe-wrp-card form-card feedback-form-wrp">
                            <h4>What you have to say is important to us. In fact, it's invaluable.
                                <br />
                                Make your comments below and then feel free to check out
                                <br />
                                our other options for information.</h4>
                            <div class="d-flex space-between feedback-frmwrp flex-wrp mt-4">
                                <div class="form-group w-49 custom-arrow">
                                    <asp:DropDownList ID="ddlsubject" CssClass="form-control feedback-select" runat="server" ClientIDMode="Static">
                                        <asp:ListItem Value="Subject">Subject</asp:ListItem>
                                        <asp:ListItem Value="Need Information">Need Information</asp:ListItem>
                                        <asp:ListItem Value="Customer Feedback">Customer Feedback</asp:ListItem>
                                        <asp:ListItem Value="Website Related">Website Related</asp:ListItem>
                                        <asp:ListItem Value="Other Comments">Other Comments</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlsubject" InitialValue="Subject" ValidationGroup="reqValid" ErrorMessage="Select Post" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <!--<select class="form-control feedback-select">
								    <option selected>Subject</option>
								    <option>Subject</option>
								    <option>Industry Classification</option>
								    <option>Industry Classification</option>
								  </select>-->
                                </div>
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtname" CssClass="form-control" MaxLength="50" placeholder="NAME" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtname" ValidationGroup="reqValid" ErrorMessage="Enter Your Name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtname" ValidationExpression="[a-zA-Z][a-zA-Z ]*" Display="Dynamic" ErrorMessage="Please Enter Valid Name" ForeColor="Red" ValidationGroup="reqValid"></asp:RegularExpressionValidator>
                                    <!--<input type="text" class="form-control" id="name" placeholder="NAME">-->
                                </div>
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="EMAIL ADDRESS" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtemail" ValidationGroup="reqValid" ErrorMessage="Enter Your Email Id" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationGroup="reqValid"></asp:RegularExpressionValidator>
                                    <!--<input type="text" class="form-control" id="email" placeholder="EMAIL ADDRESS">-->
                                </div>
                                <div class="form-group w-49">
                                    <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server" placeholder="CONTACT NUMBER" TextMode="Number" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmobile" ValidationGroup="reqValid" ErrorMessage="Enter Your Number" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtmobile" ValidationExpression="[1-9]{1}[0-9]{9}" ValidationGroup="reqValid" ErrorMessage="Enter Valid Number" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <!--<input type="text" class="form-control" id="contact" placeholder="CONTACT NUMBER">-->
                                </div>
                                <div class="form-group w-100">
                                    <textarea runat="server" class="form-control feedback-comment" placeholder="COMMENT" rows="6" id="comment"></textarea>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="comment" ValidationGroup="reqValid" ErrorMessage="Comment Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>


                            </div>

                            <h4 class="mt-3 recommend-radiohead">How likely are you to recommend</h4>
                            <div class="type-of-recommedradio">
                                <div class="individual-customradio">
                                    <asp:RadioButton ID="recommend1" Text="Definitely" GroupName="radio-group" runat="server" OnCheckedChanged="recommend1_CheckedChanged" />
                                    <!-- <input type="radio" id="recommend1" name="radio-group" checked>
                            <label for="recommend1">Definitely</label>-->
                                </div>
                                <!--End of the individualcustom radio-->
                                <div class="individual-customradio">
                                    <asp:RadioButton ID="recommend2" Text="Most Likely" GroupName="radio-group" runat="server" OnCheckedChanged="recommend2_CheckedChanged" />
                                    <!--<input type="radio" id="recommend2" name="radio-group" >
                            <label for="recommend2">Most Likely</label>-->
                                </div>
                                <!--End of the individualcustom radio-->
                                <div class="individual-customradio">
                                    <asp:RadioButton ID="recommend3" Text="Likely" GroupName="radio-group" runat="server" OnCheckedChanged="recommend3_CheckedChanged" />
                                    <!--<input type="radio" id="recommend3" name="radio-group" >
                            <label for="recommend3">Likely</label>-->
                                </div>
                                <!--End of the individualcustom radio-->
                                <div class="individual-customradio">
                                    <asp:RadioButton ID="recommend4" Text="Most not Likely" GroupName="radio-group" runat="server" OnCheckedChanged="recommend4_CheckedChanged" />
                                    <!--<input type="radio" id="recommend4" name="radio-group" >
                            <label for="recommend4">Most not Likely</label>-->
                                </div>
                                <!--End of the individualcustom radio-->
                                <div class="individual-customradio">
                                    <asp:RadioButton ID="recommend5" Text="Not Likely" GroupName="radio-group" runat="server" OnCheckedChanged="recommend5_CheckedChanged" />
                                    <!--<input type="radio" id="recommend5" name="radio-group" >
                            <label for="recommend5">Not Likely</label>-->
                                </div>
                                <!--End of the individualcustom radio-->

                            </div>
                            <!--End of the type of recommend-->

                            <div class="captcha-div mt-4 mb-2">
                                <div class="g-recaptcha" data-sitekey="6LcqFg8UAAAAADUK7coDHgoeTXEdJ9JQICdCyVcP"></div>
                            </div>
                            <!--End of the captcha div-->

                            <div class="btn-group mt-2">
                                <asp:Button ID="btnsubmit" CssClass="btn btn-orange btn-lg text-uppercase feedback-subbtn" runat="server" Text="submit" ValidationGroup="reqValid" OnClick="btnsubmit_Click" />
                                <!--<button class="btn btn-orange btn-lg text-uppercase feedback-subbtn">submit</button>-->
                            </div>
                        </div>
                        <!--subscribe-wrp-card-->
				</div><!--subscribe-wrp-->
			</div><!--col-md-12-->

			</div>
		</div>
	</main>
</asp:Content>
