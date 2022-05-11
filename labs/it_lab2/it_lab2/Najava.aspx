<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Najava.aspx.cs" Inherits="it_lab2.Najava" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
           <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="txtKorisnik" runat="server" style="width: 100%"></asp:TextBox>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="txtLozinka" runat="server" style="width: 100%" AutoPostBack="True" OnTextChanged="txtLozinka_TextChanged"></asp:TextBox>
           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="btnPodnesi" runat="server" Text="Button" OnClick="btnPodnesi_Click" />
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Label ID="lblObidi" runat="server" Text=""></asp:Label>
       </div>
</asp:Content>
