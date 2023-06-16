<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageBath.aspx.cs" Inherits="ManageBath" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            $('#<%=GVbath.ClientID%>').prepend($("<thead></thead>").append($('#<%=GVbath.ClientID%>').find("tbody tr:first"))).DataTable({
                "bPaginate": true,
                "bLengthChange": false,
                "bFilter": true,
                "bInfo": false,
                "ordering": false,
                "bAutoWidth": false
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="text-center mt-5 pt-2 mb-5">
        <asp:Label runat="server" ID="lblMessage" ForeColor="Green"></asp:Label>
    </div>
    <asp:GridView runat="server" ID="GVbath" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped bg-white text-center w-50 shadow-lg m-auto" OnRowEditing="GVbath_RowEditing" OnRowDeleting="GVbath_RowDeleting" OnRowCommand="GVbath_RowCommand" >
        <Columns>
            <asp:BoundField HeaderText="Bath(s)" DataField="Bath" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnEdit" Text="Edit" CommandName="edit" CommandArgument='<%# Eval("BathID") %>' CssClass="btn btn-warning"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnDel" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("BathID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

