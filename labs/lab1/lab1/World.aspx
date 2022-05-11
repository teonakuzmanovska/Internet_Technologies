<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="World.aspx.cs" Inherits="lab1.World" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron col-lg-12">
        <h1>WORLD</h1>
        <h2>Travelling agency</h2>
    </div>

    <div class="container">
        <div class="col-md-12">
            <div class="m-4">
                Ime: <asp:TextBox ID="Ime" runat="server"></asp:TextBox>
            </div>

            <div class="m-4">
                Prezime: <asp:TextBox ID="Prezime" runat="server"></asp:TextBox>
            </div>

            <div class="m-4">
                Vozrast: <asp:TextBox ID="Vozrast" runat="server"></asp:TextBox>
            </div>

            <div class="m-4">
                Odberete destinacija:
                <asp:DropDownList ID="Grad" runat="server">
                    <asp:ListItem Value="3">Rim</asp:ListItem>
                    <asp:ListItem Value="6">London</asp:ListItem>
                    <asp:ListItem Value="5">Tokio</asp:ListItem>
                    <asp:ListItem Value="6">Sofija</asp:ListItem>
                    <asp:ListItem Value="8">Istanbul</asp:ListItem>
                    <asp:ListItem Value="7">Toronto</asp:ListItem>
                    <asp:ListItem Value="6">Majami</asp:ListItem>
                    <asp:ListItem Value="6">Zagreb</asp:ListItem>
                    <asp:ListItem Value="7">Belgrad</asp:ListItem>
                    <asp:ListItem Value="6">Moskva</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="m-4">
                Odberete shalter
                <asp:DropDownList ID="Shalter" runat="server">
                    <asp:ListItem Value="1">Shalter 1</asp:ListItem>
                    <asp:ListItem Value="2">Shalter 2</asp:ListItem>
                    <asp:ListItem Value="3">Shalter 3</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="m-4">
                <asp:Button ID="Vnesi" runat="server" Text="Vnesi" OnClick="Vnesi_Click"/>
            </div>

            <div class="m-4">

                <h3>Vkupna statistika</h3>

                <div class="m-4">
                    Vkupen promet: <asp:Label ID="vkupenPromet" runat="server" Text=""></asp:Label>
                </div>

                <div class="m-4">
                    Vkupno prodadeni karti: <asp:Label ID="vkupnoKarti" runat="server" Text=""></asp:Label>
                </div>

                <div class="m-4">
                    Uspeshnost na agencijata: <asp:Label ID="uspeshnost" runat="server" Text=""></asp:Label>
                </div>

            </div>

            <div class="m-4">

                <div class="m-4">
                    <h3>Poedinechna statistika</h3>

                    <div class="m-4">
                        Odberi shalter
                        <asp:DropDownList ID="ShalterProverka" runat="server">
                            <asp:ListItem Value="1">Shalter 1</asp:ListItem>
                            <asp:ListItem Value="2">Shalter 2</asp:ListItem>
                            <asp:ListItem Value="3">Shalter 3</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                
                    <div class="m-4">
                        <asp:Button ID="ProveriShalteri" runat="server" Text="Proveri statistika po shalter" OnClick="ProveriShalteri_Click"/>
                    </div>
                
                </div>
                
                <div class="m-4">
                    Prodadeni karti na shalter <asp:Label ID="kartiPoShalter" runat="server" Text=""></asp:Label>
                </div>

                <div class="m-4">
                    Promet na shalter <asp:Label ID="prometPoShalter" runat="server" Text=""></asp:Label>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
