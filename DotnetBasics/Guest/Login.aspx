<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/GuestMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Guest_Default" %>

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
    <h2>Login</h2>
    <table class="table table-hover" border="1">
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
            <td colspan="2" align="center">
                <asp:Button ID="btn_login" runat="server" CssClass="btn btn-success" Text="Login" OnClick="btn_login_Click" />
            </td>
        </tr>
    </table>
                </div>
                </div>
                </div>
</asp:Content>

