<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Converter.aspx.cs" Inherits="it_aud2.Converter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">

        <div class="row text-center">
            
            <div class="m-4">
                Vnesete ime na valuta:
                <br />
                <asp:TextBox ID="ImeNaValuta" runat="server"></asp:TextBox>
            </div>

            <div class="m-4">
                Vnesete vrednost na valuta:
                <br />
                <asp:TextBox ID="VrednostNaValuta" runat="server"></asp:TextBox>
            </div>


            <br />
            
            <div class="m-4">
                <asp:Button ID="DodadiValuta" runat="server" Text="Dodadi Valuta" OnClick="DodadiValuta_Click"/>
                <asp:Button ID="IzbrishiValuta" runat="server" Text="Izbrishi Valuta" OnClick="IzbrishiValuta_Click"/>
            </div>

            <br />

            <div class="m-4">
                <asp:RadioButtonList ID="ListaValuti" runat="server" OnSelectedIndexChanged="ListaValuti_SelectedIndexChanged" AutoPostBack="True" ></asp:RadioButtonList>
            </div>

            <div class="m-4">
                Broj na valuti <asp:Label ID="BrojNaValuti" runat="server" Text="0"></asp:Label>
            </div>

            <div class="m-4">
                Vnesete vrednost za konvertiranje: <asp:TextBox ID="ZaKonvertiranje" runat="server"></asp:TextBox>
            </div>
            
            <br />

            <div class="m-4">
                <asp:Label ID="Status" runat="server" Text=""></asp:Label>
                <asp:Label ID="Rezultat" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
