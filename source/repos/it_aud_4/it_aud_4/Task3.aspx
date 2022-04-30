<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Task3.aspx.cs" Inherits="it_aud_4.Task3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin: 20px;">
        <div class="row" style="margin-top: 10px;">
            <asp:ValidationSummary class="text-danger" ID="ValidationSummary1" runat="server" ValidationGroup="group1" />
        </div>
       <div class="row">
           <div class="col-md-3">
               <asp:TextBox ID="course" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class ="text-danger"
                   ID="courseRequired" 
                   runat="server" 
                   ErrorMessage="Name of course is required"
                   ControlToValidate="course"
                   Display="None"
                   ValidationGroup="group1">

               </asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="grade" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class ="text-danger"
                   ID="gradeRequired" 
                   runat="server" 
                   ErrorMessage="Grade is required"
                   ControlToValidate="grade"
                   Display="None"
                   ValidationGroup="group1">

               </asp:RequiredFieldValidator>
               <asp:RangeValidator 
                   class ="text-danger"
                   ID="gradeRange" 
                   runat="server" 
                   ErrorMessage="Grade must be in range 5-10"
                   ControlToValidate="grade"
                   MaximumValue="10" 
                   MinimumValue="5" 
                   Type="Integer"
                   Display="None"
                   ValidationGroup="group1">

               </asp:RangeValidator>
           </div>
       </div>

       <div class="row" style="margin-top: 10px;">
           <div class="col-md-3">
               <asp:TextBox ID="date" runat="server" style="width: 100%"></asp:TextBox>
           </div>
           <div class="col-md-9 text-left">
               <asp:RequiredFieldValidator 
                   class ="text-danger"
                   ID="dateRequired" 
                   runat="server" 
                   ErrorMessage="Date is required"
                   ControlToValidate="date"
                   Display="None"
                   ValidationGroup="group1">

               </asp:RequiredFieldValidator>
               <asp:CompareValidator
                   class ="text-danger"
                   ID="dateCompare" 
                   runat="server" 
                   ErrorMessage="The date should be older or equal to today" 
                   ControlToValidate="date"
                   ValueToCompare="2022-04-01" 
                   Operator="LessThanEqual"
                   Display="None"
                   ValidationGroup="group1">
                   
               </asp:CompareValidator>
           </div>
       </div>

       <div class="row" style="margin-left: 0px; margin-top: 10px;">
           <asp:Button ID="submit" runat="server" Text="submit" OnClick="submit_Click" ValidationGroup="group1"/>
       </div>

        <div class="row" style="margin-left: 0px; margin-top: 10px;">
            <asp:Label ID="uspeh" runat="server" Text="" CssClass="text-success"></asp:Label>
       </div>
   </div>
</asp:Content>
