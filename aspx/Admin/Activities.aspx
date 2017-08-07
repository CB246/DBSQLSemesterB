<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Activities.aspx.cs" Inherits="aspx_Admin_Activities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- ==========START OF CSS================= -->

    <!-- Bootstrap Core Css -->
    <link href="/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Bootstrap Select Css -->
    <link href="/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

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

    <section class="content">
        <form runat="server">
            <!-- ACTIVITIES PAGE -->
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- KG CHOOSE CARD -->
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Choose A Kindergarden
                                </h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 50%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbKG" class="btn-group bootstrap-select form-control show-tick"></asp:ListBox>
                                        </div>
                                        <div class="col-sm-6" style="margin-bottom: 0px;">
                                            <div class="form-group form-float" style="margin-bottom: 0px;">
                                                <asp:Button ID="btnAddKgOpinion" runat="server" Text="Add Opinion" class="btn btn-block btn-lg bg-cyan" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ACTIVITIES TABLE CARD -->
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Activities
                                </h2>
                            </div>
                            <div class="body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="padding: 5px 10px; width: 1%;">Hours</th>
                                                <th style="padding: 5px 10px">Sunday</th>
                                                <th style="padding: 5px 10px">Monday</th>
                                                <th style="padding: 5px 10px">Tuesday</th>
                                                <th style="padding: 5px 10px">Wednesday</th>
                                                <th style="padding: 5px 10px">Thursday</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">16:00</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1600c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1600c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1600c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1600c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1600c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">16:30</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1630c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1630c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1630c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1630c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1630c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">17:00</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1700c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1700c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1700c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1700c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1700c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">17:30</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1730c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1730c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1730c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1730c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1730c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">18:00</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1800c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1800c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1800c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1800c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1800c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">18:30</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1830c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1830c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1830c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1830c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1830c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">19:00</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1900c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1900c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1900c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1900c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1900c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">19:30</th>
                                                <td style="padding: 5px 10px" runat="server" id="r1930c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1930c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1930c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1930c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r1930c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">20:00</th>
                                                <td style="padding: 5px 10px" runat="server" id="r2000c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2000c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2000c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2000c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2000c5"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding: 5px 10px">20:30</th>
                                                <td style="padding: 5px 10px" runat="server" id="r2030c1"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2030c2"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2030c3"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2030c4"></td>
                                                <td style="padding: 5px 10px" runat="server" id="r2030c5"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- ADD ACTIVITY CARD -->
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Add Activity
                                <small>Here you can add new activity.</small>
                                </h2>
                            </div>
                            <div class="body">
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

