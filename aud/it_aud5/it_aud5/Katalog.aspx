<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Katalog.aspx.cs" Inherits="it_aud5.Katalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xs-offset-4 col-xs-8">
        <asp:LinkButton ID="StruchnaLiteratura" runat="server" OnClick="StruchnaLiteratura_Click">Struchna literatura</asp:LinkButton>
        <br>
        <asp:LinkButton ID="Beletristika" runat="server" OnClick="Beletristika_Click">Beletristika</asp:LinkButton>
        <br>
        <asp:LinkButton ID="Magazini" runat="server" OnClick="Magazini_Click" >Magazini</asp:LinkButton>
    </div>
</asp:Content>
