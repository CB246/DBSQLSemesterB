<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="aspx_SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <title>Sign Up | Bootstrap Based Admin Template - Material Design</title>
    <!-- Favicon-->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Core Css -->
    <link href="/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- Waves Effect Css -->
    <link href="/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Bootstrap Select Css -->
    <link href="/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="/css/style.css" rel="stylesheet" />

    <style>
        .val-err-msg {
            color: red;
            font-size: 12px;
            font-weight: bold;
        }
    </style>

</head>
<body runat="server" class="signup-page" style="margin-top: 3%">
    <div class="signup-box">
        <div class="logo" style="font-size: 30px;">
            <small>Kindergardens of Haifa</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_up" method="POST" runat="server">
                    <div class="msg" style="margin-bottom: 15px;">Register a new membership</div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <asp:TextBox ID="tbLogin" runat="server" placeholder="User ID (9 digits)" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="loginVal" Display="Dynamic" class="val-err-msg" ValidationGroup="signingUp" ErrorMessage="ID Field is empty" runat="server" ControlToValidate="tbLogin"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="loginRegExVal" runat="server" Display="Dynamic" class="val-err-msg" ValidationGroup="signingUp" ErrorMessage="Please enter 9 digits ID" ControlToValidate="tbLogin" ValidationExpression="[0-9]{9}"></asp:RegularExpressionValidator>
                    </div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>

                        <div class="form-line" style="width: 50%">
                            <asp:TextBox ID="tbFirstName" runat="server" type="text" placeholder="First Name" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-line" style="width: 50%">
                            <asp:TextBox ID="tbLastName" runat="server" Style="padding-left: 5px;" type="text" placeholder="Last Name" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="fnVal" class="val-err-msg m-r-10" runat="server" Display="Dynamic" ErrorMessage="First Name is empty" ValidationGroup="signingUp" ControlToValidate="tbFirstName"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="fnRegExVal" runat="server" Display="Dynamic" class="val-err-msg m-r-10" ValidationGroup="signingUp" ErrorMessage="Fisrt Name isn't correct" ControlToValidate="tbFirstName" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="lsVal" class="val-err-msg" runat="server" Display="Dynamic" ErrorMessage="Last Name is empty" ValidationGroup="signingUp" ControlToValidate="tbLastName"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="lnRegExVal" runat="server" Display="Dynamic" class="val-err-msg" ValidationGroup="signingUp" ErrorMessage="LAst Name isn't correct" ControlToValidate="tbLastName" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    </div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">people</i>
                        </span>
                        <div class="form-line align-center" style="color: #959595">
                            <asp:RadioButtonList ID="rblGender" runat="server" Width="100%" RepeatDirection="Horizontal" Style="margin-left: auto; margin-right: auto">
                                <asp:ListItem Text="Male"></asp:ListItem>
                                <asp:ListItem Text="Female"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:RequiredFieldValidator ID="genVal" Display="Dynamic" ValidationGroup="signingUp" class="val-err-msg" ErrorMessage="Gender is empty" runat="server" ControlToValidate="rblGender"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">date_range</i>
                        </span>
                        <div class="form-line">
                            <asp:TextBox ID="tbDOB" runat="server" type="date" Style="color: #959595" min="1950-01-01" max="2020-12-31" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="dobVal" Display="Dynamic" runat="server" ErrorMessage="Date of Birth is empty" ValidationGroup="signingUp" class="val-err-msg" ControlToValidate="tbDOB"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <asp:TextBox ID="tbPassword" runat="server" type="password" placeholder="Password" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="passVal" Display="Dynamic" runat="server" ErrorMessage="Password is empty" ValidationGroup="signingUp" class="val-err-msg" ControlToValidate="tbPassword"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group" style="margin-bottom: 15px;">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <asp:TextBox ID="tbPasswordConfirm" runat="server" type="password" placeholder="Confirm Password" class="form-control"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="passConfVal" Display="Dynamic" runat="server" ErrorMessage="Password Confirmation is empty" ValidationGroup="signingUp" class="val-err-msg" ControlToValidate="tbPasswordConfirm"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="passCompVal" runat="server" ValidationGroup="signingUp" class="val-err-msg" Display="Dynamic" ErrorMessage="Wrong confirmation" ControlToValidate="tbPasswordConfirm" ControlToCompare="tbPassword"></asp:CompareValidator>
                    </div>
                    <asp:Button ID="btnSignUp" runat="server" ValidationGroup="signingUp" UseSubmitBehavior="false" OnClick="btnSignUp_Click" Text="SIGN UP" class="btn btn-block btn-lg bg-pink" />
                    <div class="m-t-15 m-b--5 align-center">
                        <a href="/aspx/Login.aspx">You already have a membership?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Input Mask Plugin Js -->
    <script src="/plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="/plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="/plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Autosize Plugin Js -->
    <script src="/plugins/autosize/autosize.js"></script>

    <!-- Custom Js -->
    <script src="/js/admin.js"></script>
    <script src="/js/pages/examples/sign-up.js"></script>
</body>
</html>
