<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="it_aud2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <div class="m-3">
                Izberete grad:
                <br/>
                <asp:ListBox ID="ListaGradovi" runat="server" SelectionMode="Multiple">
                    <asp:ListItem Value="0">Skopje</asp:ListItem>
                    <asp:ListItem Value="20">Veles</asp:ListItem>
                    <asp:ListItem Value="60">Bitola</asp:ListItem>
                </asp:ListBox>
            </div>
            <div class="m-3">
                <asp:Button ID="PrikazhiGrad" runat="server" Text="PrikazhiGrad" OnClick="PrikazhiGrad_Click"/>
            </div>
            <div class="m-3">
                Selektiraniot grad e:  <asp:Label ID="SelektiranGrad" runat="server" Text="(none)"></asp:Label>
                <br />
                Oddalechenosta od Skopje e: <asp:Label ID="Oddalechenost" runat="server" Text="(none)"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
