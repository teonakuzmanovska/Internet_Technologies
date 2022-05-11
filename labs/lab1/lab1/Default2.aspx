<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="lab1.Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <table align=center>
        <asp:Panel ID="pnlPanela1" runat="server" Font-Names="Arial" ForeColor="Red">
            <div class="m-4">
                <asp:TextBox ID="txtOperand1" runat="server" EnableViewState="False"></asp:TextBox>
            </div>
            <div class="m-4">
                <asp:TextBox ID="txtOperand2" runat="server" AutoPostBack="True" OnTextChanged="txtOperand2_TextChanged"></asp:TextBox>
            </div>
            <div class="m-4">
                <asp:Label ID="lblRezultat" runat="server" Text="Rezultat" EnableViewState="False"></asp:Label>
            </div>
            <div class="m-4">
                <asp:Button ID="btnSoberi" runat="server" Text="Soberi" OnClick="btnSoberi_Click"/>
            </div>
        </asp:Panel>

        <asp:CheckBox ID="chbVidlivo" runat="server" Text="Vidlivo" OnCheckedChanged="chbVidlivo_CheckedChanged" AutoPostBack="True" />
            
    </table>
</div>
</asp:Content>
