<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImgCoordinates.aspx.cs" Inherits="it_aud2.ImgCoordinates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row m-4">
            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/sample_img.jpg" />
        </div>

        <div class="row m-4">
            <asp:Label ID="Coordinates" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
