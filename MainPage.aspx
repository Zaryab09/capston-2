<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="css/jquery.dataTables.css" rel="stylesheet" />
    <script src="js/bootstrap.bundle.js"></script>
    <link href="fontsawesome/all.css" rel="stylesheet" />
    <link href="fontsawesome/fontawesome.css" rel="stylesheet" />
    <script src="js/jquery-3.6.3.js"></script>
    <script src="js/jquery-ui.js"></script>
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <style>
        .wrapper {
            background-image: url("images/dashboard picture.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        .cover-container {
            max-width: 60em;
        }

        .nav-masthead .nav-link {
            padding: .25rem 0;
            font-weight: 700;
            color: rgba(255, 255, 255, .5);
            background-color: transparent;
            border-bottom: .25rem solid transparent;
        }

            .nav-masthead .nav-link:hover,
            .nav-masthead .nav-link:focus {
                border-bottom-color: rgba(255, 255, 255, .25);
            }

            .nav-masthead .nav-link + .nav-link {
                margin-left: 1rem;
            }

        .nav-masthead .active {
            color: #fff;
            border-bottom-color: #fff;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            let PlotArea = ["1-5 Marla", "6-10 Marla", "11-15 Marla", "16-20 Marla", "21-25 Marla", "26-30 Marla", "31-35 Marla", "36-40 Marla", "41-45 Marla", "46-50 Marla",
                "1-5 Kanal", "6-10 Kanal", "11-15 Kanal", "16-20 Kanal", "21-25 Kanal", "26-30 Kanal", "31-35 Kanal", "36-40 Kanal", "41-45 Kanal", "46-50 Kanal",
                "1-5 Acre", "6-10 Acre", "11-15 Acre", "16-20 Acre", "21-25 Acre", "26-30 Acre", "31-35 Acre", "36-40 Acre", "41-45 Acre", "46-50 Acre",
                "1-5 Murabba", "6-10 Murabba", "11-15 Murabba", "16-20 Murabba", "21-25 Murabba", "26-30 Murabba", "31-35 Murabba", "36-40 Murabba", "41-45 Murabba", "46-50 Murabba"
            ];
            let Location = ["Shaheen Enclave, Sargodha", "University Road, Sargodha", "Roshaan Homes, Sargodha",
                "New Satellite Town, Sargodha", "Nazeer Garden, Sargodha", "Khayaban-e-Naveed, Sargodha", "Muhafiz Town, Sargodha",
                "Bahria Town, Lahore", "Shalimar Town, Lahore", "New PAF Colony, Lahore", "Canal View Colony, Lahore", "PIA Society, Lahore",
                "Johar Town, Lahore", "Khayaban-e-Amin, Lahore", "Railway Housing Society, Lahore", "Askari Colony, Lahore", "State Life Society, Lahore",
                "Bahria Town, Karachi", "DHA Defence, Karachi", "Gulshan e Iqbal, Karachi", "Civil Lines, Karachi", "Gulshan e Maymar, Karachi",
                "Surjani Town, Karachi", "Shaheed e Millat Road, Karachi", "M A Jinnah Road, Karachi", "Askari Malir Cantonment, Karachi",
                "Chenab Gardens, Faisalabad", "Civil Lines, Faisalabad", "Khayaban Colony, Faisalabad", "Muslim Town, Faisalabad",
                "Peoples Colony No 1, Faisalabad", "Peoples Colony No 2, Faisalabad", "Sitara Valley, Faisalabad", "Rehman Villas, Faisalabad",
                "Fatima Jinnah Town, Multan", "Al Fatah Modern City, Multan", "Askari Bypass, Multan", "Industrial Estate, Multan",
                "Rasheedabad, Multan", "Officers Town, Multan", "Punjab Small Industries, Multan", "Northern Bypass, Multan",
                "Qasim Town, Hyderabad", "Abdullah Garden, Hyderabad", "Happy Homes Road, Hyderabad", "Hyderabad Bypass, Hyderabad",
                "Gulistan e Sajjad, Hyderabad", "Railway Lines Colony, Hyderabad", "Citizen Colony, Hyderabad", "Zafar Hosuing Scheme, Hyderabad",
                "DHA, Islamabad", "Gulberg Greens, Islamabad", "Bahria Town, Islamabad", "Blue World City, Islamabad", "Park View City, Islamabad",
                "Ghauri Town, Islamabad", "Capital Smart City, Islamabad", "Nova City, Islamabad", "Multi Gardens B17, Islamabad",
                "Bahria Town, Rawalpindi", "Gulrez Housing Scheme, Rawalpindi", "Airport Housing Scheme, Rawalpindi", "Bahria Greens, Rawalpindi",
                "Peshawar Road, Rawalpindi", "Chakri Road, Rawalpindi", "Murree Road, Rawalpindi", "Ghous e Azam Road, Rawalpindi",
                "Citi Housing Society, Sialkot", "Wazirabad Road, Sialkot", "Defence Road, Sialkot", "Aziz Garden, Sialkot", "Airport Avenue Housing, Sialkot",
                "Iqbal Town, Sialkot", "Toheed Town, Sialkot", "Cantt Road, Sialkot", "Chenab Rangers Road, Sialkot", "Zeeshan Colony, Sialkot",
                "Master City Housing, Gujranwala", "Garden Town, Gujranwala", "Citi Housing Society, Gujranwala", "Palm City Housing, Gujranwala",
                "Wapda Town, Gujranwala", "Royal Palm, Gujranwala", "Fazaia Housing Scheme, Gujranwala", "Master City, Gujranwala"];
            $("#<%=txbLocation.ClientID%>").autocomplete({
                source: Location
            });
            $("#<%=txbPlotLocation.ClientID%>").autocomplete({
                source: Location
            });
            $("#<%=txbPlotArea.ClientID%>").autocomplete({
                source: PlotArea
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- Cover -->

            <div class="wrapper d-flex text-center text-white mb-3" style="height: 90vh">
                <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
                    <header class="mb-auto">
                        <div>
                            <h3 class="float-md-start mb-0"><a href="MainPage.aspx" class="text-decoration-none text-white">Apna Ghar</a></h3>
                            <nav class="nav nav-masthead justify-content-center float-md-end">
                                <a class="nav-link" href="MainPage.aspx">HOME</a>
                                <a class="nav-link" href="Blog.aspx">BLOG</a>
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">ADD PROPERTY
                                </a>
                                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="AddHouse.aspx">Add House</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="AddPlot.aspx">Add Plot</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="ViewUploadedHouse.aspx">View Uploaded Houses</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="ViewUploadedPlot.aspx">View Uploaded Plots</a></li>
                                </ul>
                            </nav>
                        </div>
                    </header>

                    <main class="px-3">
                        <h1 class="mb-4">Search Property</h1>
                        <div class="row">

                            <!-- First -->

                            <div class="col-5"></div>

                            <div class="col-2 mb-2">
                                <label class="mb-2 fs-5">Purpose</label>
                                <asp:DropDownList runat="server" ID="ddlPurpose" CssClass="form-select shadow-sm">
                                    <asp:ListItem Value="Sale" Text="Sale"></asp:ListItem>
                                    <asp:ListItem Value="Rent" Text="Rent"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-5"></div>

                            <!-- Second -->

                            <div class="col-3"></div>

                            <div class="col-6 mb-2">
                                <label class="mb-2 fs-5">Location</label>
                                <asp:TextBox runat="server" ID="txbLocation" CssClass="form-control shadow-sm"></asp:TextBox>
                            </div>

                            <div class="col-3"></div>

                            <!-- Third -->

                            <div class="col-3"></div>

                            <div class="col-2 mb-3">
                                <label class="mb-2 fs-5">City</label>
                                <asp:DropDownList runat="server" ID="ddlCity" CssClass="form-select shadow-sm"></asp:DropDownList>
                            </div>
                            <div class="col-2 mb-3">
                                <label class="mb-2 fs-5">Property Type</label>
                                <asp:DropDownList runat="server" ID="ddlPropertyType" CssClass="form-select shadow-sm"></asp:DropDownList>
                            </div>
                            <div class="col-2 mb-3">
                                <label class="mb-2 fs-5">Area (Marla)</label>
                                <asp:DropDownList runat="server" ID="ddlPropertyArea" CssClass="form-select shadow-sm"></asp:DropDownList>
                            </div>

                            <div class="col-3"></div>

                            <!-- Button -->

                            <div class="col-3"></div>

                            <div class="col-6">
                                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-lg btn-light fw-bold border-white bg-white w-25" OnClick="btnSearch_Click" />
                            </div>

                            <div class="col-3"></div>
                        </div>
                    </main>

                    <footer class="mt-auto text-white-50">
                        <p>A user-friendly and informative platform to search for properties, access detailed information, and connect with our team of professionals.</p>
                    </footer>
                </div>
            </div>

            <!-- No Property Message -->

            <h3 runat="server" id="H3message" class="text-danger text-center"></h3>

            <!-- Search Result -->
            <div class="row">
                <div class="col-3"></div>

                <div class="col-6">
                    <div class="row pt-5 pb-2">
                        <asp:GridView runat="server" ID="GVsearchresult" AutoGenerateColumns="false" CssClass="border-0" OnRowCommand="GVsearchresult_RowCommand">
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
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lblArea" Text='<%# Eval("PropertyArea") + "&nbspMarla" %>' CssClass="fw-bold fs-4"></asp:Label>
                                        <div class="mb-1"></div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="btnViewDetails" Text="View Details" CssClass="btn btn-secondary" CommandName="viewDetails" CommandArgument='<%# Eval("HouseID") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div class="col-3"></div>
            </div>

            <!-- Extra Features -->

            <a name="explore"></a>
            <div class="container px-4 py-5" id="hanging-icons">
                <h4 class="pb-3 fw-bold border-bottom">Explore more on <span class="text-secondary">Apna Ghar</span></h4>
                <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
                    <a href="AreaUnitConverter.aspx" class="text-decoration-none text-dark">
                        <div class="col d-flex align-items-start">
                            <div class="text-dark flex-shrink-0 me-3">
                                <i class="fa-solid fa-calculator fa-4x text-warning"></i>
                            </div>
                            <div>
                                <h5>Area Unit Converter</h5>
                                <p class="text-secondary">Convert any area unit and construction cost instantly.</p>
                            </div>
                        </div>
                    </a>
                    <a href="PlotAssessment.aspx" class="text-decoration-none text-dark">
                        <div class="col d-flex align-items-start">
                            <div class="text-dark flex-shrink-0 me-3">
                                <i class="fa-solid fa-location-crosshairs fa-4x text-danger"></i>
                            </div>
                            <div>
                                <h5>Plot Assessment</h5>
                                <p class="text-secondary">Get property assessment and cost estimate.</p>
                            </div>
                        </div>
                    </a>
                    <a href="AreaFinder.aspx" class="text-decoration-none text-dark">
                        <div class="col d-flex align-items-start">
                            <div class="text-dark flex-shrink-0 me-3">
                                <i class="fa-solid fa-search-location fa-4x text-primary"></i>
                            </div>
                            <div>
                                <h5>Area Finder</h5>
                                <p class="text-secondary">Find and explore housing societies in Pakistan.</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Search Plots -->

            <div class="bg-dark text-secondary px-4 py-5 mb-5 text-center">
                <div class="py-5">
                    <h1 class="mb-4 text-white">Search Plot</h1>
                    <div class="row">

                        <!-- First -->

                        <div class="col-3"></div>

                        <div class="col-6 mb-2">
                            <label class="mb-2 fs-5 text-white">Location</label>
                            <asp:TextBox runat="server" ID="txbPlotLocation" CssClass="form-control shadow-sm"></asp:TextBox>
                        </div>

                        <div class="col-3"></div>

                        <!-- Second -->

                        <div class="col-3"></div>

                        <div class="col-2 mb-3">
                            <label class="mb-2 fs-5 text-white">City</label>
                            <asp:DropDownList runat="server" ID="ddlPlotCity" CssClass="form-select shadow-sm"></asp:DropDownList>
                        </div>
                        <div class="col-2 mb-3">
                            <label class="mb-2 fs-5 text-white">Property Type</label>
                            <asp:DropDownList runat="server" ID="ddlPlotType" CssClass="form-select shadow-sm"></asp:DropDownList>
                        </div>
                        <div class="col-2 mb-3">
                            <label class="mb-2 fs-5 text-white">Area</label>
                            <asp:TextBox runat="server" ID="txbPlotArea" CssClass="form-control shadow-sm"></asp:TextBox>
                        </div>

                        <div class="col-3"></div>

                        <!-- Button -->

                        <div class="col-3"></div>

                        <div class="col-6">
                            <asp:Button runat="server" ID="btnPlotSearch" Text="Search" CssClass="btn btn-lg btn-outline-light fw-bold border-white w-25" OnClick="btnPlotSearch_Click" />
                        </div>

                        <div class="col-3"></div>
                    </div>
                </div>
            </div>

            <!-- No Property Message -->

            <h3 runat="server" id="noPlotMessage" class="text-danger text-center"></h3>

            <!-- Plot Search Result -->

            <div class="row">
                <div class="col-3"></div>

                <div class="col-6">
                    <div class="row pt-5 pb-2">
                        <asp:GridView runat="server" ID="GVplotResult" AutoGenerateColumns="false" CssClass="border-0 mb-5" OnRowCommand="GVplotResult_RowCommand">
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

            <!-- Our Services -->

            <div class="container px-4 pt-2 pb-5" id="hanging-icon">
                <h4 class="pb-3 fw-bold border-bottom">Our <span class="text-secondary">Services</span></h4>
                <div class="row mt-4">
                    <div class="col-lg-4 text-center">
                        <asp:Image runat="server" ID="serviceImg1" CssClass="rounded-circle shadow-lg mb-3" ImageUrl="~/images/serviceImg1.jpg" Height="140px" Width="140px" />

                        <h3>Property Listings</h3>
                        <p class="text-secondary">
                            Explore thousands of properties on our website, ranging from apartments and houses to commercial spaces and 
                            land. Our user-friendly search features make it easy to find the perfect property that fits your needs.
                        </p>
                    </div>
                    <div class="col-lg-4 text-center">
                        <asp:Image runat="server" ID="serviceImg2" CssClass="rounded-circle shadow-lg mb-3" ImageUrl="~/images/serviceImg2.jpg" Height="140px" Width="140px" />

                        <h3>Plot Assessment</h3>
                        <p class="text-secondary">
                            Our property assessment module employs cutting-edge algorithms and extensive data analysis to deliver accurate estimates of plot costs.
                             We provide reliable valuations that help users make informed decisions.
                        </p>
                    </div>
                    <div class="col-lg-4 text-center">
                        <asp:Image runat="server" ID="serviceImg3" CssClass="rounded-circle shadow-lg mb-3" ImageUrl="~/images/serviceImg3.jpg" Height="140px" Width="140px" />

                        <h3>Property Management</h3>
                        <p class="text-secondary">
                            Our dedicated property management team takes care of day-to-day operations, allowing you to maximize the returns on your investment 
                            properties. From tenant screening to rent collection and property maintenance, we ensure hassle-free management.
                        </p>
                    </div>
                </div>

            </div>

            <!-- For Sale Links -->

            <div class="container px-4 pb-5">
                <div class="row">
                    <h4 class="pb-3 fw-bold border-bottom">Popular <span class="text-secondary">Locations</span></h4>
                    <div class="col-4">
                        <h5 class="pb-1 fw-bold">Popular Locations for <span class="text-secondary">Plots</span></h5>
                        <div class="row py-2">
                            <asp:GridView runat="server" ID="GVplots" AutoGenerateColumns="false" CssClass="border-0" OnRowCommand="GVplots_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <i class="fa-solid fa-arrow-right fa-1x text-secondary"></i><span>Plots for sale in </span>
                                            <asp:LinkButton runat="server" ID="lnkBtnPlots" Text='<%# Eval("CityName") %>' CommandName="explorePlot" CommandArgument='<%# Eval("CityID") %>' CssClass="text-decoration-none text-secondary fw-bold"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="col-4">
                        <h5 class="pb-1 fw-bold">Popular Locations for <span class="text-secondary">Houses (Sale)</span></h5>
                        <div class="row py-2">
                            <asp:GridView runat="server" ID="GVsale" AutoGenerateColumns="false" CssClass="border-0" OnRowCommand="GVsale_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <i class="fa-solid fa-arrow-right fa-1x text-secondary"></i><span class="text-secondary">House for sale in </span>
                                            <asp:LinkButton runat="server" ID="lnkBtnPlots" Text='<%# Eval("CityName") %>' CommandName="exploreSale" CommandArgument='<%# Eval("CityID") %>' CssClass="text-decoration-none text-secondary fw-bold"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="col-4">
                        <h5 class="pb-1 fw-bold">Popular Locations for <span class="text-secondary">Houses (Rent)</span></h5>
                        <div class="row py-2">
                            <asp:GridView runat="server" ID="GVrent" AutoGenerateColumns="false" CssClass="border-0" OnRowCommand="GVrent_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <i class="fa-solid fa-arrow-right fa-1x text-secondary"></i><span class="text-secondary">House for rent in </span>
                                            <asp:LinkButton runat="server" ID="lnkBtnPlots" Text='<%# Eval("CityName") %>' CommandName="exploreRent" CommandArgument='<%# Eval("CityID") %>' CssClass="text-decoration-none text-secondary fw-bold"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Carosuel Design -->



            <!-- Footer -->

            <div class="container-fluid">
                <footer class="row row-cols-5 py-5 border-top bg-dark">
                    <div class="col">
                        <p class="text-muted">&copy; ApnaGhar | 2021</p>
                    </div>

                    <div class="col">
                    </div>

                    <div class="col">
                        <h5 class="text-white">Quick Links</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
                            <li class="nav-item mb-2"><a href="Blog.aspx" class="nav-link p-0 text-muted">Blog</a></li>
                            <li class="nav-item mb-2"><a href="AddPlot.aspx" class="nav-link p-0 text-muted">Add Plot</a></li>
                            <li class="nav-item mb-2"><a href="AddHouse.aspx" class="nav-link p-0 text-muted">Add House</a></li>
                        </ul>
                    </div>

                    <div class="col">
                        <h5 class="text-white">Our Policies</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="PrivacyPolicy.aspx" class="nav-link p-0 text-muted">Privacy Policy</a></li>
                            <li class="nav-item mb-2"><a href="CopyrightPolicy.aspx" class="nav-link p-0 text-muted">Copyright Policy</a></li>
                            <li class="nav-item mb-2"><a href="TermsAndAgreements.aspx" class="nav-link p-0 text-muted">Terms and Agreements</a></li>
                        </ul>
                    </div>

                    <div class="col">
                        <h5 class="text-white">Explore More</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="AreaUnitConverter.aspx" class="nav-link p-0 text-muted">Unit Converter</a></li>
                            <li class="nav-item mb-2"><a href="PlotAssessment.aspx" class="nav-link p-0 text-muted">Plot Assessment</a></li>
                            <li class="nav-item mb-2"><a href="AreaFinder.aspx" class="nav-link p-0 text-muted">Area Finder</a></li>
                            <li class="nav-item mb-2"><a href="Blog.aspx" class="nav-link p-0 text-muted">About</a></li>
                        </ul>
                    </div>
                </footer>
            </div>

        </div>
    </form>
</body>
</html>
