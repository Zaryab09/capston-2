<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWebsite.master" AutoEventWireup="true" CodeFile="PlotDetails.aspx.cs" Inherits="PlotDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container card card-body border-0 shadow-lg w-75 my-5">
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <asp:Image runat="server" ID="image1" Width="100%" Height="100%" aria-hidden="true" CssClass="bd-placeholder-img" preserveAspectRatio="xMidYMid slice" focusable="false" AlternateText="Error loading the image" />
                </div>
                <div class="carousel-item">
                    <asp:Image runat="server" ID="image2" Width="100%" Height="100%" aria-hidden="true" CssClass="bd-placeholder-img" preserveAspectRatio="xMidYMid slice" focusable="false" AlternateText="Error loading the image" />
                </div>
                <div class="carousel-item">
                    <asp:Image runat="server" ID="image3" Width="100%" Height="100%" aria-hidden="true" CssClass="bd-placeholder-img" preserveAspectRatio="xMidYMid slice" focusable="false" AlternateText="Error loading the image" />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <h3 class="mb-4 mt-4">Property <span class="text-secondary fw-bold">Details:</span></h3>
        <div class="row">
            <div class="col-2"></div>

            <div class="col-4">
                <i class="fa-solid fa-calendar-days fa-1x text-secondary"></i>&nbsp;&nbsp;<label class="fw-bold">Upload Date:</label>
                <p runat="server" id="dateDetails"></p>
                <div></div>
                <i class="fa-solid fa-city fa-1x text-secondary"></i>&nbsp;&nbsp;<label class="fw-bold">City:</label>
                <p runat="server" id="cityDetails"></p>
                <div></div>
                <i class="fa-solid fa-building-user fa-1x text-secondary"></i>&nbsp;&nbsp;<label runat="server" class="fw-bold">Type:</label>
                <p runat="server" id="typeDetails"></p>
                <div></div>
                <i class="fa-solid fa-location-dot fa-1x text-secondary"></i>&nbsp;&nbsp;<label runat="server" class="fw-bold">Location:</label>
                <p runat="server" id="locationDetails"></p>
            </div>
            <div class="col-1"></div>
            <div class="col-4">
                <i class="fa-solid fa-map-location fa-1x text-secondary"></i>&nbsp;&nbsp;<label runat="server" class="fw-bold">Area:</label>
                <p runat="server" id="areaDetails"></p>
                <div></div>
                <i class="fa-solid fa-money-bill fa-1x text-secondary"></i>&nbsp;&nbsp;<label runat="server" class="fw-bold">Price:</label>
                <p runat="server" id="priceDetails"></p>
                <div></div>
                <i class="fa-solid fa-contact-book fa-1x text-secondary"></i>&nbsp;&nbsp;<label runat="server" class="fw-bold">Email:</label>
                <p runat="server" id="emailDetails"></p>
                <div></div>
                <i class="fa-solid fa-contact-card fa-1x text-secondary"></i>&nbsp;&nbsp;<label runat="server" class="fw-bold">Contact:</label>
                <p runat="server" id="contactDetails"></p>
            </div>
            <div class="col-1"></div>
            <div class="col-2"></div>
            <div class="col-8">
                <i class="fa-solid fa-pen-square fa-1x text-secondary"></i>&nbsp;&nbsp;<label runat="server" class="fw-bold">Description:</label>
                <p runat="server" id="descriptionDetails"></p>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
</asp:Content>

