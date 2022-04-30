<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="task4.aspx.cs" Inherits="it_aud_4.task4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin: 20px;">
       <div class="row">
           <div class="col-md-3">
               <asp:TextBox ID="phone" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="phoneRequired" 
                   runat="server" 
                   ErrorMessage="Required phone number"
                   ControlToValidate="phone">

               </asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator 
                   class="text-danger"
                   ID="phoneRegex" 
                   runat="server" 
                   ErrorMessage="phone must be in format +389 70 000 000"
                   ControlToValidate="phone"
                   ValidationExpression="\+389 7[0-8] \d{3} \d{3}">

               </asp:RegularExpressionValidator>
           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="submit" runat="server" Text="Button" OnClick="submit_Click" />
       </div>

       <div class="row text-success" style="margin-left: 0px; margin-top: 10px;">
           <asp:Label ID="status" runat="server" Text=""></asp:Label>
       </div>
   </div>
</asp:Content>
