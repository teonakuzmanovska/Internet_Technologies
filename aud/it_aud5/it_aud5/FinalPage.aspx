<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FinalPage.aspx.cs" Inherits="it_aud5.Final" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xs-12 text-center">

        <div class="row">
            <div class="col-xs-12 text-center">
                <h1>Kupeni proizvodi</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 text-center">
                <asp:ListBox ID="kupeni" runat="server"></asp:ListBox>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-center">
                <asp:Label ID="vkupno" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
    </div>
</asp:Content>
