<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="AddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container card card-body border-0 shadow-lg py-5 w-75" style="background-color: white; margin-top: 10px;">
        <div class="row d-flex justify-content-center">
            <div class="col-12 text-center mb-2">
                <i class="fa-solid fa-circle-user fa-4x"></i>
            </div>
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 col-12 mb-2">
                <label class="form-label">First Name</label>
                <asp:TextBox runat="server" ID="txbFirstname" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVfirstname" ControlToValidate="txbFirstname" Text="*" ErrorMessage="Please enter first name!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="AddAdmin"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 col-12 mb-2">
                <label class="form-label">Last Name</label>
                <asp:TextBox runat="server" ID="txbLastname" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVlastname" ControlToValidate="txbLastname" Text="*" ErrorMessage="Please enter last name!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="AddAdmin"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 col-12 mb-2">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txbEmail" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVemail" ControlToValidate="txbEmail" Text="*" ErrorMessage="Please enter email address!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="AddAdmin"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="REVemail" ControlToValidate="txbEmail" Text="*" ErrorMessage="Invalid email formate!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true" ForeColor="Red" ValidationGroup="AddAdmin"></asp:RegularExpressionValidator>
            </div>
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 col-12 mb-2">
                <label class="form-label">Admin Status</label>
                <asp:DropDownList runat="server" ID="ddlAddAdmin" CssClass="dropdown form-select shadow-sm bg-light">
                    <asp:ListItem Value="Select" Text="Select"></asp:ListItem>
                    <asp:ListItem Value="True" Text="Active"></asp:ListItem>
                    <asp:ListItem Value="False" Text="Inactive"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="RFVddlAddAdmin" ControlToValidate="ddlAddAdmin" InitialValue="Select" Text="*" ErrorMessage="Please select admin status!" SetFocusOnError="true" ValidationGroup="AddAdmin" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 col-12 mb-2">
                <label class="form-label">Password</label>
                <asp:TextBox runat="server" ID="txbPassword" CssClass="form-control shadow-sm bg-light" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVpassword" ControlToValidate="txbPassword" Text="*" ErrorMessage="Please enter password!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="AddAdmin"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 col-12 mb-2">
                <label class="form-label">Confirm Password</label>
                <asp:TextBox runat="server" ID="txbConfirmPassword" CssClass="form-control shadow-sm bg-light" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVconfirmpassword" ControlToValidate="txbConfirmPassword" Text="*" ErrorMessage="Please confirm password!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="AddAdmin"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ID="COMPpassword" ControlToValidate="txbConfirmPassword" ControlToCompare="txbPassword" Text="*" ErrorMessage="Passwords didn't match!" SetFocusOnError="true" ValidationGroup="AddAdmin" ForeColor="Red"></asp:CompareValidator>
            </div>
            <div class="d-flex justify-content-center">
            <asp:ValidationSummary runat="server" ID="ValidationSummary1" ForeColor="Red" ValidationGroup="AddAdmin" />
            </div>
            <div class="text-center mb-1">
                <asp:Label runat="server" ID="lblMessage" ForeColor="Green"></asp:Label>
                <asp:Label runat="server" ID="lblDuplication" ForeColor="Red"></asp:Label>
            </div>
            <div class="d-flex justify-content-center">
                <asp:Button runat="server" ID="btnAddAdmin" Text="Save" CssClass="btn btn-dark w-25 mb-2" ValidationGroup="AddAdmin" OnClick="btnAddAdmin_Click" />
            </div>
            <div class="d-flex justify-content-center">
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn btn-dark w-25" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>

