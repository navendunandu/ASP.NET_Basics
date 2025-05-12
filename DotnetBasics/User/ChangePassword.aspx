<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .error-message {
            color: red;
            font-size: 0.9em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container my-5">
        <div class="card">
            <div class="container my-3">
                <h2>Change Password</h2>
                <table class="table table-hover" border="1">
                    <tr>
                        <td>Old Password</td>
                        <td>
                            <asp:TextBox ID="txt_oldpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_oldpassword"
                                ErrorMessage="Password is required" CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_oldpassword"
                                ErrorMessage="Password must be 8-20 characters, including letters and numbers" CssClass="error-message" Display="Dynamic"
                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$" />
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
                            <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-success" Text="Change Password" OnClick="btn_submit_Click" />
                            <asp:ValidationSummary ID="vsSummary" runat="server" CssClass="error-message" DisplayMode="BulletList" ShowSummary="true" HeaderText="Please fix the following errors:" />
                        </td>
                    </tr>
                    </table>
            </div>
        </div>
    </div>
</asp:Content>

