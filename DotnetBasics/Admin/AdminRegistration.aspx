<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminRegistration.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:TextBox ID="txt_pass" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td>
                <asp:TextBox ID="txt_cpass" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="Register" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdAdmins" runat="server" AutoGenerateColumns="False" OnRowCommand="grdAdmins_RowCommand">
        <Columns>
            <asp:BoundField DataField="admin_name" HeaderText="Name" />
            <asp:BoundField DataField="admin_email" HeaderText="Email" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button ID="btn_edit" runat="server" CommandArgument='<%# Eval("admin_id") %>' CommandName="EditAdmin" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btn_delete" runat="server" CommandArgument='<%# Eval("admin_id") %>' CommandName="DeleteAdmin" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

