<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container mt-5">
        <div class="card mx-auto shadow" style="max-width: 600px;">
            <div class="card-header text-center bg-primary text-white">
                <h4>My Profile</h4>
            </div>
            <div class="card-body">
                <asp:DetailsView ID="dtlView" runat="server" AutoGenerateRows="False" CssClass="table table-bordered">
                    <Fields>
                        <asp:TemplateField HeaderText="Profile Picture">
                            <ItemTemplate>
                                <div class="text-center">
                                    <img alt="User Photo" src='../Assets/Files/User/<%#Eval("user_photo")%>' class="img-thumbnail" style="height: 100px;" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="user_name" HeaderText="Name" />
                        <asp:BoundField DataField="user_email" HeaderText="Email" />
                        <asp:BoundField DataField="user_contact" HeaderText="Contact" />
                        <asp:BoundField DataField="user_gender" HeaderText="Gender" />
                        <asp:BoundField DataField="user_dob" HeaderText="Date of Birth" />
                        <asp:BoundField DataField="user_address" HeaderText="Address" />
                        <asp:BoundField DataField="district_name" HeaderText="District" />
                        <asp:BoundField DataField="place_name" HeaderText="Place" />
                    </Fields>
                </asp:DetailsView>
            </div>
        </div>
    </div>
</asp:Content>

