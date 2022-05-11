<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="task1.aspx.cs" Inherits="it_lab2.task1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="row">

    <div class="col-4">

            <div class="m-4">
                Ime
                <asp:TextBox ID="txtIme" runat="server"></asp:TextBox>
            </div>
    
            <div class="m-4">
                Prezime
                <asp:TextBox ID="txtPrezime" runat="server"></asp:TextBox>
            </div>

            <div class="m-4">
                Od:
                <asp:DropDownList ID="ddlOd" runat="server">
                    <asp:ListItem>Skopje</asp:ListItem>
                    <asp:ListItem>Ohrid</asp:ListItem>
                    <asp:ListItem>Belgrad</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="m-4">
                Do:
                <asp:DropDownList ID="ddlDo" runat="server">
                    <asp:ListItem>London</asp:ListItem>
                    <asp:ListItem>Paris</asp:ListItem>
                    <asp:ListItem>Venezia</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="m-4">
                Datum na trganje
                <asp:DropDownList ID="ddlDen" runat="server"></asp:DropDownList>
                <asp:DropDownList ID="ddlMesec" runat="server"></asp:DropDownList>
                <asp:DropDownList ID="ddlGodina" runat="server"></asp:DropDownList>
            </div>

            <div class="m-4">
                Vreme na trganje
                <asp:DropDownList ID="ddlVreme" runat="server"></asp:DropDownList>
            </div>

            <div class="m-4">
                Prevozno sredstvo
                <asp:ListBox ID="lstSredstvo" runat="server">
                    <asp:ListItem Value="https://image.shutterstock.com/image-vector/plane-icon-vector-solid-illustration-260nw-403728235.jpg">Avion</asp:ListItem>
                    <asp:ListItem Value="https://image.shutterstock.com/image-vector/red-train-transportation-vector-illustration-260nw-1804097230.jpg">Voz</asp:ListItem>
                </asp:ListBox>
            </div>

            <div class="m-4">
                Zona
                <asp:RadioButtonList ID="rblZona" runat="server">
                    <asp:ListItem>Pushachi</asp:ListItem>
                    <asp:ListItem>Nepushachi</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </div>

            <div class="m-4">
                Klasa
                <asp:RadioButtonList ID="rblKlasa" runat="server">
                    <asp:ListItem>Ekonomska</asp:ListItem>
                    <asp:ListItem>Biznis</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </div>

            <div class="m-4">
                Posluga
                <asp:CheckBoxList ID="cblPosluga" runat="server">
                    <asp:ListItem>Pijalok</asp:ListItem>
                    <asp:ListItem>Kafe</asp:ListItem>
                    <asp:ListItem>Obrok</asp:ListItem>
                </asp:CheckBoxList>
                <br />
            </div>
    
            <div class="m-4">
                <asp:Button ID="btnPodnesi" runat="server" Text="Podnesi" OnClick="btnPodnesi_Click" />
            </div>

    </div>

    
    <div class="col-4">

        <asp:Panel ID="pnlPanela1" runat="server" style="background-color : lightgoldenrodyellow" Visible="false">

            <div class="m-4">
                Pochituvan patniku 
                <br />
                <asp:Label ID="lblPatnik" runat="server" Text=""></asp:Label>
            </div>
    
            <div class="m-4">
                Izdadena vi e karta za 
                <br />
                <asp:Label ID="lblSredstvo" runat="server" Text=""></asp:Label>
            </div>
    
            <div class="m-4">
                so pochetna destinacija od 
                <br />
                <asp:Label ID="lblOd" runat="server" Text=""></asp:Label>
            </div>
    
            <div class="m-4">
                i krajna destinacija do 
                <br />
                <asp:Label ID="lblDo" runat="server" Text=""></asp:Label>
            </div>

            <div class="m-4">
                Vremeto na poagjanje e 
                <br />
                <asp:Label ID="lblVreme" runat="server" Text=""></asp:Label>
            </div>
    
            <div class="m-4">
                Vasheto mesto na sedenje kje bide vo zonata za <asp:Label ID="lblZona" runat="server" Text=""></asp:Label>
                vo <asp:Label ID="lblKlasa" runat="server" Text=""></asp:Label> klasa
                i vo tekot na patuvanjeto kje bidete posluzheni so <asp:Label ID="lblPosluga" runat="server" Text=""></asp:Label>
            </div>

            <div class="m-4">
                <br />
                <asp:Image ID="imgSlika" runat="server" />
            </div>

            <div class="m-4">
                <br />
                <asp:Label ID="lblPoraka" runat="server" Text="Vi blagodarime na doverbata i vi posakuvame srekjen pat!"></asp:Label>
            </div>

        </asp:Panel>

    </div>

</div>


</asp:Content>
