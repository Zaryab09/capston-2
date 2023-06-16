<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWebsite.master" AutoEventWireup="true" CodeFile="Favourite.aspx.cs" Inherits="Favourite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView runat="server" ID="GVfavourite" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped bg-white text-center w-50 shadow-lg m-auto" OnRowDeleting="GVfavourite_RowDeleting" OnRowCommand="GVfavourite_RowCommand">
        <Columns>
            <asp:BoundField DataField="Location" HeaderText="Property Location" />
            <asp:BoundField DataField="Price" HeaderText="PropertyPrice" />
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnDel" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("HouseID") %>' CssClass="btn btn-danger"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

