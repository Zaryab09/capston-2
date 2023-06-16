<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .card{
            height: 230px;
            color: white;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container justify-content-center">
      <div class="row d-flex justify-content-center pt-4 pb-4">
        <div class="col-3">
            <a href="ManageAdmin.aspx" class="text-decoration-none">
                <div class="card border-0 shadow-sm bg-primary">
                <div class="card-body">
                    <i class="fa-solid fa-user fa-3x mb-3"></i>
                    <h3>SYSTEM ADMINS</h3>
                    <h1 runat="server" id="adminCount" class="fw-bold fs-1"></h1>
                </div>
            </div>
            </a>
        </div>
        <div class="col-3">
            <div class="card border-0 shadow-lg bg-warning">
                <div class="card-body">
                    <i class="fa-solid fa-house-chimney-window fa-3x mb-3"></i>
                    <h3>HOUSE FOR SALE</h3>
                    <h1 runat="server" id="saleCount" class="fw-bold fs-1"></h1>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card border-0 shadow-lg bg-secondary">
                <div class="card-body">
                    <i class="fa-solid fa-house fa-3x mb-3"></i>
                    <h3>HOUSE FOR RENT</h3>
                    <h1 runat="server" id="rentCount" class="fw-bold fs-1"></h1>
                </div>
            </div>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="col-3">
            <div class="card border-0 shadow-lg bg-danger">
                <div class="card-body">
                    <i class="fa-solid fa-globe fa-3x mb-3"></i>
                    <h3>PLOTS AVAILABLE</h3>
                    <h1 runat="server" id="plotCount" class="fw-bold fs-1"></h1>
                </div>
            </div>
        </div>
        <div class="col-3">
            <a href="ManageCity.aspx" class="text-decoration-none">
                <div class="card border-0 shadow-lg bg-info">
                <div class="card-body">
                    <i class="fa-solid fa-location-dot fa-3x mb-3"></i>
                    <h3>TOTAL<div></div>CITIES</h3>
                    <h1 runat="server" id="cityCount" class="fw-bold fs-1"></h1>
                </div>
            </div>
            </a>
        </div>
        <div class="col-3">
            <a href="ManagePropertyType.aspx" class="text-decoration-none">
                <div class="card border-0 shadow-lg bg-success">
                <div class="card-body">
                    <i class="fa-solid fa-house-laptop fa-3x mb-3"></i>
                    <h3>PROPERTY TYPES</h3>
                    <h1 runat="server" id="typeCount" class="fw-bold fs-1"></h1>
                </div>
            </div>
            </a>
        </div>
      </div>
    </div>
</asp:Content>

