<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWebsite.master" AutoEventWireup="true" CodeFile="ViewUploadedHouse.aspx.cs" Inherits="ViewUploadedHouse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="text-center text-secondary fw-bold my-5">Uploaded Houses</h3>

    <h3 runat="server" id="Hmessage" class="text-center text-danger fw-bold"></h3>

    <asp:GridView runat="server" ID="GVuploadedHouse" AllowPaging="true" OnPageIndexChanging="GVuploadedHouse_PageIndexChanging" PageSize="5" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover bg-white text-center w-75 mb-5 shadow-lg m-auto" OnRowDeleting="GVuploadedHouse_RowDeleting" OnRowCommand="GVuploadedHouse_RowCommand">
        <Columns>
            <asp:BoundField DataField="UploadDate" HeaderText="Upload Date" />
            <asp:BoundField DataField="Location" HeaderText="Property Location" />
            <asp:BoundField DataField="Price" HeaderText="Property Price" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image runat="server" ID="houseImage" ImageUrl='<%# Eval("Image1") %>' Hieght="80px" Width="80px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnDelHouse" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("HouseID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

