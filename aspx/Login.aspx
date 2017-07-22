<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="aspx_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <title>Sign In | Bootstrap Based Admin Template - Material Design</title>
    <!-- Favicon-->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Core Css -->
    <link href="../../plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- Waves Effect Css -->
    <link href="../../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="../../css/style.css" rel="stylesheet" />

    <style>
        .val-err-msg {
            color: red;
            font-size: 12px;
            font-weight: bold;
        }
    </style>

</head>
<body runat="server" class="login-page" style="margin-top: 3%">
    <div class="login-box">
        <div class="logo" style="font-size: 30px;">
            <small>Kindergardens of Haifa</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" method="POST" runat="server">
                    <div class="msg" style="margin-bottom: 15px">Sign in to start your session</div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <asp:TextBox ID="tbLogin" runat="server" EnableViewState="false" placeholder="User ID (9 digits)" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="loginVal" Display="Dynamic" runat="server" ErrorMessage="Login is empty" ValidationGroup="logining" class="val-err-msg" ControlToValidate="tbLogin"></asp:RequiredFieldValidator>
                        <div class="val-err-msg">
                            <asp:Literal runat="server" Text="" ID="litLogin"></asp:Literal>
                        </div>
                    </div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <asp:TextBox ID="tbPassword" runat="server" EnableViewState="false" type="password" placeholder="Password" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="passVal" Display="Dynamic" runat="server" ErrorMessage="Password is empty" ValidationGroup="logining" class="val-err-msg" ControlToValidate="tbPassword"></asp:RequiredFieldValidator>
                        <div class="val-err-msg">
                            <asp:Literal runat="server" Text="" ID="litPass"></asp:Literal>
                        </div>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" ValidationGroup="logining" OnClick="btnLogin_Click" Text="SIGN IN" class="btn btn-block btn-lg bg-pink" />
                    <div class="m-t-15 m-b--5 align-center">
                        <a href="SignUp.aspx">Register Now!</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="../../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../../plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="../../plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="../../js/admin.js"></script>
    <script src="../../js/pages/examples/sign-in.js"></script>
</body>
</html>
