<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Chestitka.aspx.cs" Inherits="it_aud2.Chestitka" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-5">
            <div class="m-4">
                Izberete boja na pozadina:
                <asp:DropDownList ID="Background" runat="server"></asp:DropDownList>
            </div>
            
            <div class="m-4">
                Izberete font:
                <asp:DropDownList ID="Font" runat="server"></asp:DropDownList>
            </div>
            
            <div class="m-4">
                Izberete boja na font:
                <asp:DropDownList ID="FontColor" runat="server"></asp:DropDownList>
            </div>
            
            <div class="m-4">
                Izberete golemina na font:
                <asp:TextBox ID="FontSize" runat="server"></asp:TextBox>pt
            </div>
            
            <div class="m-4">
                Izberete tip na ramka:
                <asp:RadioButtonList ID="Border" runat="server"></asp:RadioButtonList>
            </div>
            
            <div class="m-4">
                Dodadi slika?
                <asp:CheckBox ID="Slika" runat="server" />
            </div>

            <div class="m-4">
                Vnesete ja sodrzhinata na chestitkata:
                <asp:TextBox ID="Sodrzhina" runat="server"></asp:TextBox>
            </div>

            <div class="m-4">
                <asp:Button ID="Kreiraj" runat="server" Text="Kreiraj chestitka" OnClick="Kreiraj_Click" />
            </div>

            <div class="m-4">
                <asp:Panel ID="Panel" runat="server">
                    <asp:Label ID="Poraka" runat="server" Text=""></asp:Label>
                    <asp:Image ID="Image" runat="server" ImageUrl="~/sample_img.jpg" Visible="false"/>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
