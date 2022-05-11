<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default3.aspx.cs" Inherits="lab1.Default3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="m-4">
        Vnesi lozinka
       <asp:TextBox ID="txtLozinka" runat="server" TextMode="Password"></asp:TextBox>
    </div>

    <div class="m-4">
        <asp:TextBox ID="txtPoraka" runat="server" TextMode="MultiLine" ReadOnly="True" OnTextChanged="txtPoraka_TextChanged" AutoPostBack="True" ></asp:TextBox>
    </div>

    <div class="m-4">
        <asp:Button ID="btnProveri" runat="server" Text="Proveri" OnClick="btnProveri_Click" />
    </div>

    <div class="m-4">
        <asp:Button ID="btnPrvaStrana" runat="server" Text="Prva strana" Enabled="False" PostBackUrl="~/Default.aspx" />
    </div>

</asp:Content>
