<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Queries.aspx.cs" Inherits="aspx_Admin_Queries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- ==========START OF CSS================= -->

    <!-- Bootstrap Core Css -->
    <link href="/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Bootstrap Select Css -->
    <link href="/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

    <!-- JQuery DataTable Css -->
    <link href="/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" />

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

    <section class="content">
        <form runat="server">
            <!-- IMPORT PAGE -->
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Import Training Data
                                <small>Here you can import Training & Training for Assistant data</small>
                                </h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-lg-12" style="margin-bottom: 0px;">
                                        <div class="row clearfix">
                                            <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 50%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbQuery" class="btn-group bootstrap-select form-control show-tick">
                                                <asp:ListItem>Query 2 - Query Name</asp:ListItem>
                                                <asp:ListItem>Query 3 - Query Name</asp:ListItem>
                                                <asp:ListItem>Query 4 - Query Name</asp:ListItem>
                                                <asp:ListItem>Query 5 - Query Name</asp:ListItem>
                                                <asp:ListItem>Query 6 - Query Name</asp:ListItem>
                                                <asp:ListItem>Query 7 - Query Name</asp:ListItem>
                                                <asp:ListItem>Query 8a - Query Name</asp:ListItem>
                                                <asp:ListItem>Query 8b - Query Name</asp:ListItem>
                                            </asp:ListBox>
                                        </div>
                                            <asp:Button class="btn btn-lg bg-cyan" style="width: 50%" runat="server" ID="btnRunQuery" OnClick="btnRunQuery_Click" Text="Run Query" />
                                        </div>
                                    </div>
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
                        <div class="modal-body align-center table-responsive">
                            <asp:GridView ID="gvTable" runat="server" class="table table-bordered"></asp:GridView>
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

