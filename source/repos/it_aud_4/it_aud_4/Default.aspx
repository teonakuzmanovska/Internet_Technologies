<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="it_aud_4._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="container" style="margin: 20px;">
       <div class="row">
           <div class="col-md-3">
               <asp:TextBox ID="TextBox1" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               Полето е задолжително!
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="TextBox2" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               Полето е задолжително!
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="TextBox3" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               Полето е задолжително!
           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="Button1" runat="server" Text="Button" />
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
       </div>
   </div>

</asp:Content>
