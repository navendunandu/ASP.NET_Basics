<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/GuestMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Guest_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .error-message {
            color: red;
            font-size: 0.9em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container my-5">
        <div class="card">
            <div class="container my-3">
                <h2>User Registration</h2>
                <table class="table table-hover" border="1">
                    <tr>
                        <td>Name</td>
                        <td>
                            <asp:TextBox ID="txt_name" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txt_name"
                                ErrorMessage="Name is required" CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txt_name"
                                ErrorMessage="Name must contain only letters and spaces" CssClass="error-message" Display="Dynamic"
                                ValidationExpression="^[a-zA-Z\s]+$" />
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txt_email"
                                ErrorMessage="Email is required" CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txt_email"
                                ErrorMessage="Invalid email format" CssClass="error-message" Display="Dynamic"
                                ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
                        </td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td>
                            <asp:TextBox ID="txt_contact" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txt_contact"
                                ErrorMessage="Contact number is required" CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="txt_contact"
                                ErrorMessage="Invalid phone number (10 digits required)" CssClass="error-message" Display="Dynamic"
                                ValidationExpression="^\d{10}$" />
                        </td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <asp:RadioButtonList ID="rad_gender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rad_gender"
                                ErrorMessage="Please select a gender" CssClass="error-message" Display="Dynamic" />
                        </td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td>
                            <asp:TextBox ID="txt_dob" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDob" runat="server" ControlToValidate="txt_dob"
                                ErrorMessage="Date of birth is required" CssClass="error-message" Display="Dynamic" />
                            <asp:RangeValidator ID="rvDob" runat="server" ControlToValidate="txt_dob"
                                ErrorMessage="You must be at least 18 years old" CssClass="error-message" Display="Dynamic"
                                Type="Date" MinimumValue="1900-01-01" MaximumValue="2007-05-10" />
                        </td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td>
                            <asp:DropDownList ID="sel_dist" runat="server" AutoPostBack="True" CssClass="form-select" OnSelectedIndexChanged="sel_dist_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="sel_dist"
                                ErrorMessage="Please select a district" CssClass="error-message" Display="Dynamic" InitialValue="" />
                        </td>
                    </tr>
                    <tr>
                        <td>Place</td>
                        <td>
                            <asp:DropDownList ID="sel_place" runat="server" CssClass="form-select" OnSelectedIndexChanged="sel_dist_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="">Select Place</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPlace" runat="server" ControlToValidate="sel_place"
                                ErrorMessage="Please select a place" CssClass="error-message" Display="Dynamic" InitialValue="" />
                        </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>
                            <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txt_address"
                                ErrorMessage="Address is required" CssClass="error-message" Display="Dynamic" />
                        </td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td>
                            <asp:FileUpload CssClass="form-control" ID="file_photo" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvPhoto" runat="server" ControlToValidate="file_photo"
                                ErrorMessage="Please upload a photo" CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPhoto" runat="server" ControlToValidate="file_photo"
                                ErrorMessage="Only image files (jpg, png) are allowed" CssClass="error-message" Display="Dynamic"
                                ValidationExpression="^.*\.(jpg|JPG|png|PNG)$" />
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox ID="txt_password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txt_password"
                                ErrorMessage="Password is required" CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txt_password"
                                ErrorMessage="Password must be 8-20 characters, including letters and numbers" CssClass="error-message" Display="Dynamic"
                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$" />
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td>
                            <asp:TextBox ID="txt_cpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCPassword" runat="server" ControlToValidate="txt_cpassword"
                                ErrorMessage="Confirm password is required" CssClass="error-message" Display="Dynamic" />
                            <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txt_cpassword"
                                ControlToCompare="txt_password" ErrorMessage="Passwords do not match" CssClass="error-message" Display="Dynamic" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2" style="text-align: center">
                            <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" CssClass="btn btn-success" Text="Register" />
                            <asp:ValidationSummary ID="vsSummary" runat="server" CssClass="error-message" DisplayMode="BulletList" ShowSummary="true" HeaderText="Please fix the following errors:" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
