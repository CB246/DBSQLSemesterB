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
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 25%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbKG" class="btn-group bootstrap-select form-control show-tick"></asp:ListBox>
                                        </div>
                                        <div class="col-sm-3" style="margin-bottom: 0px;">
                                            <div class="form-group form-float" style="margin-bottom: 0px;">
                                                <asp:Button ID="btnGetAllClassesOfKg" runat="server" OnClick="btnGetAllClassesOfKg_Click" Text="Get All Classes" class="btn btn-block btn-lg bg-cyan" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 25%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbClNum" class="btn-group bootstrap-select form-control show-tick"></asp:ListBox>
                                        </div>
                                        <div class="col-sm-3" style="margin-bottom: 0px;">
                                            <div class="form-group form-float" style="margin-bottom: 0px;">
                                                <asp:Button ID="btnGetAllActivitiesOfKg" runat="server" OnClick="btnGetAllActivitiesOfKg_Click" Text="Get All Activities" class="btn btn-block btn-lg bg-cyan" />
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
                                    <asp:Table class="table table-bordered" runat="server" id="table1">
                                        <asp:TableHeaderRow>
                                                <asp:TableHeaderCell style="padding: 5px 10px; width: 1%;">Hours</asp:TableHeaderCell>
                                                <asp:TableHeaderCell style="padding: 5px 10px">Sunday</asp:TableHeaderCell>
                                                <asp:TableHeaderCell style="padding: 5px 10px">Monday</asp:TableHeaderCell>
                                                <asp:TableHeaderCell style="padding: 5px 10px">Tuesday</asp:TableHeaderCell>
                                                <asp:TableHeaderCell style="padding: 5px 10px">Wednesday</asp:TableHeaderCell>
                                                <asp:TableHeaderCell style="padding: 5px 10px">Thursday</asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">16:00</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r160c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r160c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r160c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r160c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r160c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">16:30</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r165c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r165c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r165c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r165c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r165c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">17:00</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r170c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r170c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r170c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r170c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r170c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">17:30</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r175c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r175c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r175c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r175c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r175c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">18:00</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r180c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r180c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r180c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r180c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r180c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">18:30</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r185c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r185c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r185c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r185c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r185c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">19:00</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r190c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r190c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r190c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r190c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r190c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">19:30</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r195c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r195c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r195c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r195c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r195c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">20:00</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r200c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r200c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r200c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r200c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r200c5"></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableHeaderCell scope="row" style="padding: 5px 10px">20:30</asp:TableHeaderCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r205c1"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r205c2"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r205c3"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r205c4"></asp:TableCell>
                                                <asp:TableCell style="padding: 5px 10px" runat="server" id="r205c5"></asp:TableCell>
                                            </asp:TableRow>
                                    </asp:Table>
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

