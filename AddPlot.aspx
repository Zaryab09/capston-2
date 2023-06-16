<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWebsite.master" AutoEventWireup="true" CodeFile="AddPlot.aspx.cs" Inherits="AddPlot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
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
            $("#<%=txbArea.ClientID%>").autocomplete({
                source: PlotArea
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container card card-body border-0 shadow-lg my-5 py-5 px-5">
        <div class="row">
            <div class="col-12 text-center mb-4 border-bottom">
                <h1>Add <span class="text-secondary fw-bold">Plot</span></h1>
            </div>

            <h3>Plot <span class="text-secondary fw-bold">Type:</span></h3>

            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">City</label>
                <asp:DropDownList runat="server" ID="ddlCity" CssClass="form-select shadow-sm bg-light"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="RFVddlCity" ControlToValidate="ddlCity" InitialValue="0" Text="*" ErrorMessage="Please select city!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Type</label>
                <asp:DropDownList runat="server" ID="ddlType" CssClass="form-select shadow-sm bg-light"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="RFVddlType" ControlToValidate="ddlType" InitialValue="0" Text="*" ErrorMessage="Please select type!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Location</label>
                <asp:TextBox runat="server" ID="txbLocation" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVtxbLocation" ControlToValidate="txbLocation" Text="*" ErrorMessage="Please add location!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <h3 class="mt-4">Plot <span class="text-secondary fw-bold">Details:</span></h3>

            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Area</label>
                <asp:TextBox runat="server" ID="txbArea" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVtxbArea" ControlToValidate="txbArea" Text="*" ErrorMessage="Please enter area!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Price (PKR -- LAKH/CRORE)</label>
                <asp:TextBox runat="server" ID="txbPrice" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVtxbPrice" ControlToValidate="txbPrice" Text="*" ErrorMessage="Please add price!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-8 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Description</label>
                <asp:TextBox runat="server" ID="txbDescription" TextMode="MultiLine" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
            </div>

            <h3 class="mt-4">Plot <span class="text-secondary fw-bold">Pictures:</span></h3>

            <div class="col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Picture(s)</label>
                <asp:FileUpload runat="server" ID="uploadPicture1" CssClass="form-control shadow-sm" />
                <asp:RequiredFieldValidator runat="server" ID="RFVupload1" ControlToValidate="uploadPicture1" Text="*" ErrorMessage="Please upload picture-1!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:FileUpload runat="server" ID="uploadPicture2" CssClass="form-control shadow-sm mt-3" />
                <asp:RequiredFieldValidator runat="server" ID="RFVupload2" ControlToValidate="uploadPicture2" Text="*" ErrorMessage="Please upload picture-2!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:FileUpload runat="server" ID="uploadPicture3" CssClass="form-control shadow-sm mt-3" />
                <asp:RequiredFieldValidator runat="server" ID="RFVupload3" ControlToValidate="uploadPicture3" Text="*" ErrorMessage="Please upload picture-3!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <h3 class="mt-4">Contact <span class="text-secondary fw-bold">Details:</span></h3>

            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Email</label>
                <asp:TextBox runat="server" ID="txbEmail" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVtxbEmail" ControlToValidate="txbEmail" Text="*" ErrorMessage="Please add e-mail!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="REGtxbEmail" ControlToValidate="txbEmail" Text="*" ErrorMessage="Invalid e-mail address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true" ValidationGroup="addHouse" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12 mb-1">
                <label class="mb-1 col-form-label fw-bold">Contact</label>
                <asp:TextBox runat="server" ID="txbContact" CssClass="form-control shadow-sm bg-light" placeholder="+92----------"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFVtxbContact" ControlToValidate="txbContact" Text="*" ErrorMessage="Please add contact!" SetFocusOnError="true" ValidationGroup="addPlot" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="d-flex justify-content-center">
                <asp:ValidationSummary runat="server" ID="VSaddPlot" ValidationGroup="addPlot" ForeColor="Red" />
            </div>
            <div class="col-12 pt-4">
                <asp:Button runat="server" ID="btnAddPlot" Text="Submit" CssClass="btn btn-secondary" ValidationGroup="addPlot" OnClick="btnAddPlot_Click" />
            </div>
        </div>
    </div>
</asp:Content>

