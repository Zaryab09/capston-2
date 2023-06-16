<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="fontsawesome/all.css" rel="stylesheet" />
    <link href="fontsawesome/fontawesome.css" rel="stylesheet" />
    <script src="js/jquery-3.6.3.js"></script>
    <script>
        function showPassword() {
            chkBox = $('#chkShowPassword');
            txbPassword = $('#txbPassword');

            if (chkBox.is(':checked')) {
                txbPassword.attr("Type", "Text");
            }
            else {
                txbPassword.attr("Type", "Password");
            }
        }
    </script>
</head>
<body style="background: linear-gradient(to right, #9EF9D8, #9DFFB3)">
    <form id="form1" runat="server">
        <div>
            <div class="container pt-5 mt-4">
                <div class="row">
                    <div class="col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 m-auto">
                        <div class="card border-0 shadow-lg py-5 px-4">
                            <div class="card-body">
                                <div class="d-flex justify-content-center mb-3">
                                    <i class="fa-solid fa-circle-user fa-4x"></i>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Email</label>
                                    <asp:TextBox runat="server" ID="txbEmail" CssClass="form-control shadow-sm bg-light"></asp:TextBox>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Password</label>
                                    <asp:TextBox runat="server" ID="txbPassword" CssClass="form-control shadow-sm bg-light" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:CheckBox runat="server" ID="chkShowPassword" CssClass="form-check" Text="&nbsp;Show Password" onclick="showPassword()" />
                                </div>
                                <div class="text-center mb-2">
                                    <asp:Label runat="server" ID="lblMessage" ForeColor="Red"></asp:Label>
                                </div>
                                <div>
                                    <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn btn-dark w-100" OnClick="btnLogin_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
