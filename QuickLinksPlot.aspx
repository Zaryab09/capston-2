<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWebsite.master" AutoEventWireup="true" CodeFile="QuickLinksPlot.aspx.cs" Inherits="QuickLinksPlot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 runat="server" id="message" class="text-danger text-center my-5"></h3>
    <div class="text-center">
    </div>
    <div class="row">
        <div class="col-3"></div>

        <div class="col-6">
            <div class="row pt-5 pb-2">
                <asp:GridView runat="server" ID="GVquickLinkPlot" AutoGenerateColumns="false" CssClass="border-0" OnRowCommand="GVquickLinkPlot_RowCommand" AllowPaging="true" PageSize="5" OnPageIndexChanging="GVquickLinkPlot_PageIndexChanging" >
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image runat="server" ID="image" ImageUrl='<%# Eval("Image1") %>' Height="250px" Width="260px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-money-bill fa-2x text-primary"></i>&nbsp;&nbsp;<i class="fa-solid fa-location-dot fa-2x text-danger"></i>&nbsp;&nbsp;<i class="fa-solid fa-map-location fa-2x text-warning"></i>
                                <div class="mb-2"></div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lblPrice" Text='<%#Eval ("Price") %>' CssClass="fw-bold fs-2"></asp:Label>
                                <div class="mb-1"></div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lblLocation" Text='<%# Eval("Location") %>' CssClass="fw-bold fs-3"></asp:Label>
                                <div class="mb-1"></div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lblArea" Text='<%# Eval("Area") %>' CssClass="fw-bold fs-4"></asp:Label>
                                <div class="mb-1"></div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="btnViewDetails" Text="View Details" CssClass="btn btn-secondary" CommandName="viewDetails" CommandArgument='<%# Eval("PlotID") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="col-3"></div>
    </div>
</asp:Content>

