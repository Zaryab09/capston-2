<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddPropertyArea.aspx.cs" Inherits="AddPropertyArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-5 pt-5">
        <div class="row">
            <div class="col-xl-5 col-lg-5 col-mg-6 col-sm-8 col-12 m-auto">
                <div class="card py-4 px-4 shadow-lg border-0">
                    <div class="card-body">
                        <div class="mb-3 text-center">
                            <i class="fa-solid fa-map-location-dot fa-4x"></i>
                        </div>
                        <div class="mb-1">
                            <label class="mb-1">Property Area (Marla)</label>
                            <asp:TextBox runat="server" ID="txbPropertyArea" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFVarea" ControlToValidate="txbPropertyArea" Text="*" ErrorMessage="Please enter property area!" SetFocusOnError="true" ValidationGroup="AddArea" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-1">
                            <asp:Label runat="server" ID="lblMessage" ForeColor="Green" CssClass="d-flex justify-content-center"></asp:Label>
                            <asp:Label runat="server" ID="lblDuplication" ForeColor="Red" CssClass="d-flex justify-content-center"></asp:Label>
                        </div>
                        <asp:ValidationSummary runat="server" ID="VSarea" ForeColor="Red" ValidationGroup="AddArea" />
                        <div>
                            <asp:Button runat="server" ID="btnPropertyArea" Text="Save" CssClass="btn btn-dark w-100 mb-2" ValidationGroup="AddArea" OnClick="btnPropertyArea_Click" />
                            <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn btn-dark w-100" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

