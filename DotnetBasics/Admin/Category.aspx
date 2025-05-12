<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Admin_Default" %>

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
            <td>Category</td>
            <td>
                <asp:TextBox ID="txt_category" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdCategory" runat="server" AutoGenerateColumns="False" OnRowCommand="grdCategory_RowCommand">
        <Columns>
            <asp:BoundField DataField="category_name" HeaderText="Category" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button ID="btn_edit" runat="server" CommandArgument='<%# Eval("category_id") %>' CommandName="EditCat" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btn_delete" runat="server" CommandArgument='<%# Eval("category_id") %>' CommandName="DeleteCat" Text="Delete"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

