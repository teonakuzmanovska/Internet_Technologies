<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="lab1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="jumbotron">
    <h1>Lab1</h1>
    <h2>Internet Technologies</h2>
</div>
<div class="m-4">
    <asp:Label ID="lblVreme1" runat="server" Text="Kontrola za prikaz na vreme" Font-Names="Arial" ForeColor="Navy" Font-Size="Medium"></asp:Label>
</div>
<div class="m-4">
    <asp:Label ID="lblVreme2" runat="server" Text="Kontrola za prikaz na vreme" Font-Names="Arial" ForeColor="Navy" Font-Size="Medium"></asp:Label>
</div>
<div class="m-4">
    <asp:Button ID="btnVreme" runat="server" Text="Kopche za prikaz na vreme" Font-Names="Arial" ForeColor="Navy" Font-Size="Medium" OnClick="btnVreme_Click"/>
</div>
<div class="m-4">
    <asp:HyperLink ID="hlSledno" runat="server" NavigateUrl="~/Default2.aspx">Default2</asp:HyperLink>
</div>
</asp:Content>
