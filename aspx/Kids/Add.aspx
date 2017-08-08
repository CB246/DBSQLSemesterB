<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="aspx_Kids_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- ==========START OF CSS================= -->

    <!-- Bootstrap Core Css -->
    <link href="/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="/css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="/css/themes/all-themes.css" rel="stylesheet" />

    <!-- ===========START OF SCRIPTS============== -->

    <!-- Jquery Core Js -->
    <script src="/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="/plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Bootstrap Notify Plugin Js -->
    <script src="/plugins/bootstrap-notify/bootstrap-notify.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="/plugins/node-waves/waves.js"></script>

    <!-- Chart Plugins Js -->
    <script src="/plugins/chartjs/Chart.bundle.js"></script>

    <!-- Custom Js -->
    <script src="/js/admin.js"></script>
    <script src="/js/pages/ui/dialogs.js"></script>

    <!-- Demo Js -->
    <script src="/js/demo.js"></script>

    <!-- ============END OF SCRIPTS==============-->

    <style>
        .form-group .form-line .form-label {
            right: 0;
            text-align: right;
        }

        .val-err-msg {
            color: red;
            font-size: 12px;
            font-weight: bold;
        }
    </style>

    <script>
        function fillCharts(a, b, c) {
            new Chart(document.getElementById("bar_chart").getContext("2d"), getChartJs('bar', a, b, c));
        }

        function getChartJs(type, a, b, c) {
            var config = null;

            if (type === 'bar') {
                config = {
                    type: 'bar',
                    data: {
                        labels: a,
                        datasets: [{
                            label: "Average opinion",
                            data: b,
                            backgroundColor: 'rgba(0, 188, 212, 0.8)'
                        }, {
                            label: "Num of kids in kindergarden",
                            data: c,
                            backgroundColor: 'rgba(233, 30, 99, 0.8)'
                        }]
                    },
                    options: {
                        responsive: true,
                        legend: false,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                }
            }
            return config;
        }
    </script>

    <section class="content">
        <form runat="server">
            <!-- KID INFO -->
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Add Kid page
                                <small>Here you can add your kid to Kindergarden</small>
                                </h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-lg-12" style="margin-bottom: 0px;">
                                        <div class="row clearfix">
                                            <div class="col-sm-3" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbID" class="form-control" runat="server"></asp:TextBox>
                                                        <label class="form-label">ID (9 digits)</label>
                                                    </div>
                                                    <asp:RegularExpressionValidator ID="IDRegExVal" runat="server" ControlToValidate="tbID" ErrorMessage="ID must be 9 digits" Display="Dynamic" ValidationGroup="longLat" CssClass="val-err-msg" ValidationExpression="[0-9]{9}"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="IDReqVal" runat="server" ControlToValidate="tbID" Display="Dynamic" ErrorMessage="ID is empty" ValidationGroup="longLat" CssClass="val-err-msg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-3" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbLastName" class="form-control" runat="server"></asp:TextBox>
                                                        <label class="form-label">Last Name</label>
                                                    </div>
                                                    <asp:RegularExpressionValidator ID="lastNameRegExVal" runat="server" ControlToValidate="tbLastName" ErrorMessage="Last Name can only contain letters" Display="Dynamic" ValidationGroup="longLat" CssClass="val-err-msg" ValidationExpression="[A-Za-z \-]+"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="lastNameReqVal" runat="server" ControlToValidate="tbLastName" Display="Dynamic" ErrorMessage="Last Name is empty" ValidationGroup="longLat" CssClass="val-err-msg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-3" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbFirstName" class="form-control" runat="server"></asp:TextBox>
                                                        <label class="form-label">First Name</label>
                                                    </div>
                                                    <asp:RegularExpressionValidator ID="firstNameRegExVal" runat="server" ControlToValidate="tbFirstName" ErrorMessage="First Name can only contain letters" Display="Dynamic" ValidationGroup="longLat" CssClass="val-err-msg" ValidationExpression="[A-Za-z \-]+"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="firstNameReqVal" runat="server" ControlToValidate="tbFirstName" Display="Dynamic" ErrorMessage="First Name is empty" ValidationGroup="longLat" CssClass="val-err-msg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-3" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbDOB" Width="72%" TextMode="Date" class="form-control" runat="server" min="2009-09-02" max="2017-09-01"></asp:TextBox>
                                                        <label class="form-label">Date of Birth</label>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="dobReqVal" runat="server" ControlToValidate="tbDOB" Display="Dynamic" ErrorMessage="Date of Birth is empty" ValidationGroup="longLat" CssClass="val-err-msg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row clearfix">
                                            <div class="col-sm-4" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbCity" class="form-control" runat="server"></asp:TextBox>
                                                        <label class="form-label">City</label>
                                                    </div>
                                                    <asp:RegularExpressionValidator ID="cityRegExVal" runat="server" ControlToValidate="tbCity" ErrorMessage="City can only contain letters" Display="Dynamic" ValidationGroup="longLat" CssClass="val-err-msg" ValidationExpression="[A-Za-z \-]+"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="cityVal" runat="server" ValidationGroup="longLat" Display="Dynamic" ControlToValidate="tbCity" class="val-err-msg" ErrorMessage="City is empty"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbStreet" class="form-control" runat="server"></asp:TextBox>
                                                        <label class="form-label">Street</label>
                                                    </div>
                                                    <asp:RegularExpressionValidator ID="streetRegExVal" runat="server" ControlToValidate="tbStreet" ErrorMessage="Street can only contain letters" Display="Dynamic" ValidationGroup="longLat" CssClass="val-err-msg" ValidationExpression="[A-Za-z \-]+"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="streetVal" runat="server" ValidationGroup="longLat" Display="Dynamic" ControlToValidate="tbStreet" class="val-err-msg" ErrorMessage="Street is empty"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbHouseNumber" class="form-control" runat="server"></asp:TextBox>
                                                        <label class="form-label">House Number</label>
                                                    </div>
                                                    <asp:RegularExpressionValidator ID="houseNumRegExVal" runat="server" ControlToValidate="tbHouseNumber" ErrorMessage="House Number can only contain numbers" Display="Dynamic" ValidationGroup="longLat" CssClass="val-err-msg" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="houseNumVal" runat="server" ValidationGroup="longLat" Display="Dynamic" ControlToValidate="tbHouseNumber" class="val-err-msg" ErrorMessage="House Number is empty"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row clearfix">
                                            <div class="col-sm-4" style="margin-bottom: 0px;">
                                                <asp:Button ID="btnGetLongAndLat" runat="server" OnClick="btnGetLongAndLat_Click" ValidationGroup="longLat" Text="Get Longitude & Latitude" class="btn btn-block btn-lg bg-cyan" />
                                            </div>
                                            <div class="col-sm-4" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbLongitude" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                        <label class="form-label">Longitude</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="margin-bottom: 0px;">
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <asp:TextBox ID="tbLatitude" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                        <label class="form-label">Latitude</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- KG TYPE -->
            <div class="container-fluid" runat="server" id="kgType">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">
                                    Choose Kindergarden Type
                                </h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-lg-12" style="margin-bottom: 0px;">
                                        <div class="btn-group" role="group" style="width: 100%">
                                            <asp:Button ID="btnPublic" runat="server" Text="Public Kindergarden" OnClick="btnPublic_Click" class="btn bg-cyan waves-effect" Style="width: 50%" />
                                            <asp:Button ID="btnPrivate" runat="server" Text="Private Kindergargen" OnClick="btnPrivate_Click" class="btn bg-cyan waves-effect" Style="width: 50%" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- PUBLIC -->
            <div class="container-fluid" runat="server" id="pubKG">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">
                                    Public Kindergarden Information
                                </h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbKgID" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Kindergarden ID</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbKGname" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Kindergarden Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbClNum" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Class Number</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbClName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Class Name</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbKGStreet" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Street</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbKGhouseNum" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">House Number</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbKGPrice" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Cost</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbTeacherLastName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Teacher Last Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbTeacherFirstName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Teacher First Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="progress p-l-0 m-b-0">
                                            <div id="progressBarDiv" runat="server" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width: 20%"></div>
                                        </div>
                                        <div class="help-info align-center" style="font-size: 12px; margin-top: 5px; color: #999;">
                                            <asp:Label ID="lblPublicProgressBar" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-12" style="margin-bottom: 0px;">
                                        <asp:Button ID="btnAddKidToPublic" runat="server" OnClick="btnAddKidToPublic_Click" ValidationGroup="longLat" Text="Add Kid to Public Kindergarden" class="btn btn-block btn-lg bg-cyan" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- PRIVATE -->
            <div class="container-fluid" runat="server" id="privKG">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">
                                    Private Kindergarden Information
                                </h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbKGidPriv" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Kindergarden ID</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbKGnamePriv" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Kindergarden Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbClNumPriv" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Class Number</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbClNamePriv" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Class Name</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbStreetPriv" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Street</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbHouseNumPriv" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">House Number</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbPrivKGPrice" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Cost</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbPriTeacherLastName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Teacher Last Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbPrivTeacherFirstName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Teacher First Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                        <div class="progress p-l-0 m-b-0">
                                            <div id="divProgressPrivate" runat="server" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width: 20%"></div>
                                        </div>
                                        <div class="help-info align-center" style="font-size: 12px; margin-top: 5px; color: #999;">
                                            <asp:Label ID="lblProgressPrivate" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <asp:Button ID="btnPrevPrivate" runat="server" OnClick="btnPrevPrivate_Click" Text="Previous" class="btn btn-lg bg-cyan col-sm-3 m-l-15" />
                                    <asp:Button ID="btnNextPrivate" runat="server" OnClick="btnNextPrivate_Click" Text="Next" class="btn btn-lg bg-cyan col-sm-3 pull-right m-r-15" />
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-12" style="margin-bottom: 0px;">
                                        <asp:Button ID="btnAddKidToPrivate" runat="server" OnClick="btnAddKidToPrivate_Click" ValidationGroup="longLat" Text="Add Kid to Private Kindergarden" class="btn btn-block btn-lg bg-cyan" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- CHARTS -->
            <div class="container-fluid col-lg-8" runat="server" id="charts">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Charts
                                </h2>
                            </div>
                            <div class="body">
                                <canvas id="bar_chart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- OPINIONS -->
            <div class="container-fluid col-lg-4" runat="server" id="opinions">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Opinions
                                </h2>
                            </div>
                            <div class="body">
                                <div class="table-responsive">
                                    <table class="table table-condensed" runat="server" id="opinionTable">
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Default Size -->
            <div class="modal fade" runat="server" id="defaultModal" tabindex="-1" role="dialog" style="display: none;">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" runat="server" id="modalColor">
                        <div class="modal-body align-center">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer align-center">
                            <asp:Button class="btn btn-link waves-effect" runat="server" ID="cancelButton" OnClick="cancelButton_Click" Text="CLOSE" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</asp:Content>

