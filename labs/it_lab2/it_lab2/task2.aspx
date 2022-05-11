<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="task2.aspx.cs" Inherits="it_lab2.task2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="group1" class="text-danger"/>
    <div class="container" style="margin: 20px;">
       <div class="row">
           <div class="col-md-3">
               Ime <asp:TextBox ID="ime" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="imeRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi ime"
                   ControlToValidate="ime"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               Prezime <asp:TextBox ID="prezime" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="prezimeRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi prezime"
                   ControlToValidate="prezime"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               Finki ID <asp:TextBox ID="finki_id" runat="server" style="width: 100%"></asp:TextBox> @finki.ukim.mk
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="finki_idRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi id"
                   ControlToValidate="finki_id"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator 
                   class="text-danger"
                   ID="finki_idRegex" 
                   runat="server" 
                   ErrorMessage="Nepravilen format na id"
                   ValidationExpression="[A-Z]+[0-9]+(_\d{2,})?"
                   ControlToValidate="finki_id"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RegularExpressionValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               Password <asp:TextBox ID="password" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="passwordRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi password"
                   ControlToValidate="password"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator 
                   class="text-danger"
                   ID="passwordRegex" 
                   runat="server" 
                   ErrorMessage="Nevaliden format na password"
                   ValidationExpression="[a-z]+[0-9]+\.?"
                   ControlToValidate="password"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RegularExpressionValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               Confirm <asp:TextBox ID="confirmPass" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="confirmPassRequired" 
                   runat="server" 
                   ErrorMessage="Potvrdi password"
                   ControlToValidate="confirmPass"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
               <asp:CompareValidator 
                   class="text-danger"
                   ID="CompareValidator1" 
                   runat="server" 
                   ErrorMessage="Razlichni lozinki"
                   ControlToValidate="confirmPass" 
                   ControlToCompare="password"
                   ValidationGroup="group1"
                   Display="None">

               </asp:CompareValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               Adresa <asp:TextBox ID="adresa" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="adresaRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi adresa"
                   ControlToValidate="adresa"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               Telefon <asp:TextBox ID="telefon" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="telefonRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi telefon"
                   ControlToValidate="telefon"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator
                   class="text-danger"
                   ID="telefonRegex" 
                   runat="server" 
                   ErrorMessage="Nepostoechki telefon"
                   ValidationExpression="(\+389 7[0-8] \d{3} \d{3})|(\+389 2 \d{4} \d{3})"
                   ControlToValidate="telefon"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RegularExpressionValidator>
           </div>
       </div>

       <div class="row">
           <div class="col-md-3">
               Pol
               <asp:RadioButtonList ID="pol" runat="server">
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Z</asp:ListItem>
               </asp:RadioButtonList>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator
                   class="text-danger"
                   ID="polRequired" 
                   runat="server" 
                   ErrorMessage="Odberi pol"
                   ControlToValidate="pol"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row">
           <div class="col-md-3">
               Datum <asp:TextBox ID="datum" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="datumRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi datum na ragjanje"
                   ControlToValidate="datum"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator
                   class="text-danger"
                   ID="datumRegex" 
                   runat="server" 
                   ErrorMessage="Nevaliden datum"
                   ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"
                   ControlToValidate="datum"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RegularExpressionValidator>
           </div>
       </div>

       <div class="row">
           <div class="col-md-3">
               Zanimanje <asp:TextBox ID="zanimanje" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="zanimanjeRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi zanimanje"
                   ControlToValidate="zanimanje"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row">
           <div class="col-md-3">
               Godini iskustvo <asp:TextBox ID="iskustvo" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="iskustvoRequired" 
                   runat="server" 
                   ErrorMessage="Vnesi godini iskustvo"
                   ControlToValidate="iskustvo"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="podnesi" runat="server" Text="Podnesi" OnClick="podnesi_Click" ValidationGroup="group1"/>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Label ID="poraka" runat="server" Text=""></asp:Label>
       </div>
   </div>
</asp:Content>
