<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .mainBar{
            display: flex
;
    align-items: center;
    justify-content: space-between;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container my-5">
        <div class="card">
            <div class="container my-3 mainBar">
                <div class="welcome">
                    Welcome,
                <h4>
                    <asp:Label runat="server" Text="" ID="lbl_name"></asp:Label>
                </h4>
                </div>
                <div class="links">
                    <asp:LinkButton ID="btn_profile" runat="server" OnClick="btn_profile_Click">My Profile</asp:LinkButton>
                    <asp:LinkButton ID="btn_edit" runat="server" OnClick="btn_edit_Click">Edit Profile</asp:LinkButton>
                    <asp:LinkButton ID="btn_pass" runat="server" OnClick="btn_pass_Click">Change Password</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

