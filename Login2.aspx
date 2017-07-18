﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login2.aspx.cs" Inherits="Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <title>Login, Register form</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>

    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>

    <link rel="stylesheet" href="css/login2Style.css"/>
</head>
<body>
    <div class="login-box">
        <div class="lb-header">
            <a href="#" class="active" id="login-box-link">Login</a>
            <a href="#" id="signup-box-link">Sign Up</a>
        </div>
        <form class="email-login">
            <div class="u-form-group">
                <input type="email" placeholder="Email" />
            </div>
            <div class="u-form-group">
                <input type="password" placeholder="Password" />
            </div>
            <div class="u-form-group">
                <button>Log in</button>
            </div>
            <div class="u-form-group">
                <a href="#" class="forgot-password">Forgot password?</a>
            </div>
        </form>
        <form class="email-signup">
            <div class="u-form-group">
                <input type="email" placeholder="Email" />
            </div>
            <div class="u-form-group">
                <input type="password" placeholder="Password" />
            </div>
            <div class="u-form-group">
                <input type="password" placeholder="Confirm Password" />
            </div>
            <div class="u-form-group">
                <button>Sign Up</button>
            </div>
        </form>
    </div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/login2.js"></script>
</body>
</html>
