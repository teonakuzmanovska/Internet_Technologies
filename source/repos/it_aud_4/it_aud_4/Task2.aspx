<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Task2.aspx.cs" Inherits="it_aud_4.Task2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin: 20px;">
       <div class="row">
           <div class="col-md-3">
               <asp:DropDownList ID="city" runat="server">
                   <asp:ListItem>(grad)</asp:ListItem>
                   <asp:ListItem>Skopje</asp:ListItem>
                   <asp:ListItem>Bitola</asp:ListItem>
                   <asp:ListItem>Ohrid</asp:ListItem>
                   <asp:ListItem>Veles</asp:ListItem>
               </asp:DropDownList>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class="text-danger"
                   ID="cityRequired" 
                   runat="server" 
                   ErrorMessage="Izberete grad od listata"
                   ControlToValidate="city"
                   InitialValue="(grad)">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
       </div>

        <div class="row" style="margin-left: 0px; margin-top: 10px;">
            <asp:Label ID="prikaz" runat="server" Text="Selektiraniot grad e: "></asp:Label>
       </div>
   </div>
</asp:Content>
