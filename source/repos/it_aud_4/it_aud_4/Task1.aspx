<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Task1.aspx.cs" Inherits="it_aud_4.Task1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin: 20px;">
       <div class="row">
           <div class="col-md-3">
               <asp:TextBox ID="email" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RegularExpressionValidator 
                   class="text-danger"
                   ID="emailRegex" runat="server" 
                   ErrorMessage="Nevalidna email adresa"
                   ControlToValidate="email"
                   ValidationExpression="\S+@\w+\.\w+">
               </asp:RegularExpressionValidator>

               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="emailRequired" 
                   runat="server" 
                   ErrorMessage="Poleto za email e zadolzhitelno"
                   ControlToValidate="email">
               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="password" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RegularExpressionValidator 
                   class="text-danger"
                   ID="passwordRegex" runat="server" 
                   ErrorMessage="Nevaliden password"
                   ControlToValidate="password"
                   ValidationExpression=".{5,}">
               </asp:RegularExpressionValidator>

               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="passwordRequired" 
                   runat="server" 
                   ErrorMessage="Poleto za password e zadolzhitelno"
                   ControlToValidate="password">
               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="confirmPass" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:CompareValidator 
                   class="text-danger"
                   ID="passwordCompare" runat="server" 
                   ErrorMessage="Password-ot ne se sovpagja"
                   ControlToCompare="password"
                   ControlToValidate="confirmPass">
               </asp:CompareValidator>

               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="confirmPassRequired" 
                   runat="server" 
                   ErrorMessage="Poleto za potvrduvanje password e zadolzhitelno"
                   ControlToValidate="confirmPass">
               </asp:RequiredFieldValidator>

           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="register" runat="server" Text="Registriraj se" OnClick="register_Click" />
       </div>

        <div class="row" style="margin-left: 0px; margin-top: 10px;">
            <asp:Label ID="username" runat="server" Text=""></asp:Label>
       </div>

   </div>
</asp:Content>
