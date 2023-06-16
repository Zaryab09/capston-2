<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWebsite.master" AutoEventWireup="true" CodeFile="ViewUploadedPlot.aspx.cs" Inherits="ViewUploadedPlot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="text-center text-secondary fw-bold my-5">Uploaded Plots</h3>

    <h3 runat="server" id="Hmessage" class="text-center text-danger fw-bold"></h3>

    <asp:GridView runat="server" ID="GVuploadedPlot" AllowPaging="true" PageSize="5" OnPageIndexChanging="GVuploadedPlot_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover bg-white text-center w-75 mb-5 shadow-lg m-auto" OnRowDeleting="GVuploadedPlot_RowDeleting" OnRowCommand="GVuploadedPlot_RowCommand" >
        <Columns>
            <asp:BoundField DataField="UploadDate" HeaderText="Upload Date" />
            <asp:BoundField DataField="Location" HeaderText="Plot Location" />
            <asp:BoundField DataField="Price" HeaderText="Plot Price" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image runat="server" ID="plotImage" ImageUrl='<%# Eval("Image1") %>' Hieght="80px" Width="80px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkBtnDelPlot" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("PlotID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

