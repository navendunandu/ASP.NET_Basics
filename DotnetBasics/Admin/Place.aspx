<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Place.aspx.cs" Inherits="Admin_Default" %>

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
            <td>District</td>
            <td>
                <asp:DropDownList ID="sel_dist" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Place</td>
            <td>
                <asp:TextBox ID="txt_place" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="grdPlace" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grdPlace_SelectedIndexChanged" OnRowCommand="grdPlace_RowCommand" >
        <Columns>
            <asp:BoundField DataField="place_name" HeaderText="Place" />
            <asp:BoundField DataField="district_name" HeaderText="District" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button ID="btn_edit" runat="server" CommandArgument='<%# Eval("place_id") %>' Text="Edit" CommandName="EditPlace"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btn_delete" runat="server" CommandArgument='<%# Eval("place_id") %>' CommandName="DeletePlace" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

