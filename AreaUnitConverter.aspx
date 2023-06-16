<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWebsite.master" AutoEventWireup="true" CodeFile="AreaUnitConverter.aspx.cs" Inherits="AreaUnitConverter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container card card-body border-0 shadow-lg w-75 px-3 py-5 my-5">
            <div class="col-12 text-center my-5 border-bottom">
                <h1>Area Unit <span class="text-secondary fw-bold">Converter</span></h1>
            </div>
        <div class="row">
            <div class="col-1"></div>

            <div class="col-4 mb-3">
                <asp:DropDownList runat="server" ID="ddlConvert1" CssClass="form-select shadow-sm bg-light"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="RFVconvert1" ControlToValidate="ddlConvert1" InitialValue="0" Text="Please select a unit!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Convert"></asp:RequiredFieldValidator>
            </div>

            <div class="col-2"></div>

            <div class="col-4">
                <asp:DropDownList runat="server" ID="ddlConvert2" CssClass="form-select shadow-sm bg-light"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="RFVconvert2" ControlToValidate="ddlConvert2" InitialValue="0" Text="Please select a unit!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Convert"></asp:RequiredFieldValidator>
            </div>

            <div class="col-1"></div>

            <div class="col-1"></div>

            <div class="col-4">
                <asp:TextBox runat="server" ID="txbUnit1" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVunit1" ControlToValidate="txbUnit1" Text="*" ErrorMessage="Please enter a value!" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Convert"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ID="COMPunit1" ControlToValidate="txbUnit1" Operator="DataTypeCheck" Type="Integer" Text="*" ErrorMessage="Please enter a number!" SetFocusOnError="true" ValidationGroup="Convert" ForeColor="Red"></asp:CompareValidator>
            </div>

            <div class="col-2 text-center fw-bold"><i class="fa-solid fa-arrow-right-arrow-left fa-2x text-secondary"></i></div>

            <div class="col-4">
                <asp:TextBox runat="server" ID="txbUnit2" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
            </div>

            <div class="col-1"></div>

            <div class="d-flex justify-content-center">
                <asp:ValidationSummary runat="server" ID="VSconvert" ForeColor="Red" ValidationGroup="Convert" />
            </div>
            <div class="col-12 d-flex justify-content-center mt-2">
                <asp:Button runat="server" ID="btn" Text="Convert" CssClass="btn btn-secondary w-25" ValidationGroup="Convert" OnClick="btn_Click" />
            </div>
        </div>
    </div>

</asp:Content>

