<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageAreaUnit.aspx.cs" Inherits="ManageAreaUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            $('#<%=GVareaUnit.ClientID%>').prepend($("<thead></thead>").append($('#<%=GVareaUnit.ClientID%>').find("tbody tr:first"))).DataTable({
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
    <asp:GridView runat="server" ID="GVareaUnit" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped bg-white text-center w-50 shadow-lg m-auto" OnRowEditing="GVareaUnit_RowEditing" OnRowDeleting="GVareaUnit_RowDeleting" OnRowCommand="GVareaUnit_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="Area Unit" DataField="AreaUnit" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnEdit" Text="Edit" CommandName="edit" CommandArgument='<%# Eval("AreaUnitID") %>' CssClass="btn btn-warning"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnDel" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("AreaUnitID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

