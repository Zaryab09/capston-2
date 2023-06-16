<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageAdmin.aspx.cs" Inherits="ManageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            $('#<%=GVadmin.ClientID%>').prepend($("<thead></thead>").append($('#<%=GVadmin.ClientID%>').find("tbody tr:first"))).DataTable({
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
    <asp:GridView runat="server" ID="GVadmin" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped bg-white w-75 text-center shadow-lg m-auto" OnRowEditing="GVadmin_RowEditing" OnRowDeleting="GVadmin_RowDeleting" OnRowCommand="GVadmin_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="First Name" DataField="FirstName" />
            <asp:BoundField HeaderText="Last Name" DataField="LastName" />
            <asp:BoundField HeaderText="Email Address" DataField="EmailAddress" />
            <asp:BoundField HeaderText="Admin Status" DataField="AdminStatus" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnEdit" Text="Edit" CommandName="edit" CommandArgument='<%# Eval("AdminID") %>' CssClass="btn btn-warning"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnDel" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("AdminID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

