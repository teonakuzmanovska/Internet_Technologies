<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="task6.aspx.cs" Inherits="it_aud_4.task6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin: 20px;">

        <div class="row" style="margin-left: 0px; margin-top: 10px;">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="group1"/>
        </div>

        <div class="row" style="margin-left: 0px; margin-top: 10px;">
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="group2"/>
        </div>

        <div class="row">
           <div class="col-md-3">
               <asp:TextBox ID="TextBox1" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="RequiredFieldValidator1" 
                   runat="server" 
                   ErrorMessage="RequiredFieldValidator 1"
                   ControlToValidate="TextBox1"
                   ValidationGroup="group1"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

        <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="Button1" runat="server" Text="Button" ValidationGroup="group1" />
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="TextBox2" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="RequiredFieldValidator2" 
                   runat="server" 
                   ErrorMessage="RequiredFieldValidator 2"
                   ControlToValidate="TextBox2"
                   ValidationGroup="group2"
                   Display="None">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="Button2" runat="server" Text="Button" ValidationGroup="group2" OnClick="Button2_Click"/>
       </div>

       <div class="row text-success" style="margin-left: 0px; margin-top: 10px;">
           <asp:Label ID="status" runat="server" Text=""></asp:Label>
       </div>
   </div>
</asp:Content>
