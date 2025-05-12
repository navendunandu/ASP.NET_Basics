<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="District.aspx.cs" Inherits="Admin_Default"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="10" class="auto-style1">
        <tr>
            <td>District</td>
            <td>
                <asp:TextBox ID="txt_district" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_submit" runat="server" style="text-align: center" Text="Submit" OnClick="btn_submit_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdDistrict" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="grdDistrict_PageIndexChanging" OnRowCommand="grdDistrict_RowCommand" OnSelectedIndexChanged="grdDistrict_SelectedIndexChanged">
        <Columns>
            <asp:BoundField HeaderText="District" DataField="district_name" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button ID="Edit" runat="server" CommandArgument='<%# Eval("district_id") %>' CommandName="EditDist" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btn_delete" runat="server" CommandArgument='<%# Eval("district_id") %>' CommandName="DeleteDist" Text="Delete"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

