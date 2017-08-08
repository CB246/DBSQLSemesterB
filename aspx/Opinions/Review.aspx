<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="aspx_Opinions_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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

    <!-- Jquery Core Js -->
    <script src="/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="/plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="/plugins/node-waves/waves.js"></script>

    <!-- Jquery DataTable Plugin Js -->
    <script src="/plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

    <!-- Custom Js -->
    <script src="/js/admin.js"></script>
    <script src="/js/pages/tables/jquery-datatable.js"></script>

    <!-- Demo Js -->
    <script src="/js/demo.js"></script>

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
            <div class="row clearfix">
                <!-- KG OPINIONS -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>KINDERGARDENS OPINIONS
                                <small>Here you can review all kindergardens opinions.</small>
                            </h2>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom: 0px;">
                                    <div class="panel-group" id="kgOpinions" role="tablist" aria-multiselectable="true" runat="server">
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="addKgOpinion">
                                <div class="row clearfix align-center" style="position: relative;">
                                    <b>Add Opinion</b>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 25%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbKG" class="btn-group bootstrap-select form-control show-tick"></asp:ListBox>
                                        </div>
                                        <div class="col-sm-6" style="margin-bottom: 0px;">
                                            <div class="form-group form-float" style="margin-bottom: 0px;">
                                                <div class="form-line">
                                                    <asp:TextBox ID="tbKgOpinion" class="form-control" runat="server"></asp:TextBox>
                                                    <label class="form-label">Your Opinion</label>
                                                </div>
                                                <asp:RequiredFieldValidator ID="kgOpinionReqVal" runat="server" ControlToValidate="tbKgOpinion" Display="Dynamic" ErrorMessage="Opinion is empty" ValidationGroup="kgOpinion" CssClass="val-err-msg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 25%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbKgGrade" class="btn-group bootstrap-select form-control show-tick">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                            </asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnAddKgOpinion" runat="server" OnClick="btnAddKgOpinion_Click" Text="Add Opinion" ValidationGroup="kgOpinion" class="btn btn-block btn-lg bg-cyan" />
                            </div>
                            <div runat="server" id="removeKgOpinion">
                                <div class="row clearfix align-center" style="position: relative;">
                                    <b>Remove Opinion</b>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 50%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbKgOpinionID" class="btn-group bootstrap-select form-control show-tick"></asp:ListBox>
                                        </div>
                                        <div class="col-sm-6" style="margin-bottom: 0px;">
                                            <asp:Button ID="btnRemoveKgOpinion" runat="server" OnClick="btnRemoveKgOpinion_Click" Text="Remove Opinion" class="btn btn-block btn-lg bg-cyan" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# KG OPINIONS -->
                <!-- ACTIVITY OPINIONS -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>ACTIVITIES OPINOINS
                                <small>Here you can review all activities opinions.</small>
                            </h2>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom: 0px;">
                                    <div class="panel-group" id="actOpinions" role="tablist" aria-multiselectable="true" runat="server">
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="addActOpinion">
                                <div class="row clearfix align-center" style="position: relative;">
                                    <b>Add Opinion</b>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 25%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbAct" class="btn-group bootstrap-select form-control show-tick"></asp:ListBox>
                                        </div>
                                        <div class="col-sm-6" style="margin-bottom: 0px;">
                                            <div class="form-group form-float" style="margin-bottom: 0px;">
                                                <div class="form-line">
                                                    <asp:TextBox ID="tbActopinion" class="form-control" runat="server"></asp:TextBox>
                                                    <label class="form-label">Your Opinion</label>
                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbActopinion" Display="Dynamic" ErrorMessage="Opinion is empty" ValidationGroup="actOpinion" CssClass="val-err-msg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 25%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbActGrade" class="btn-group bootstrap-select form-control show-tick">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                            </asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnAddActOpinion" runat="server" OnClick="btnAddActOpinion_Click" ValidationGroup="actOpinion" Text="Add Opinion" class="btn btn-block btn-lg bg-cyan" />
                            </div>
                            <div runat="server" id="removeActOpinion">
                                <div class="row clearfix align-center" style="position: relative;">
                                    <b>Remove Opinion</b>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12" style="width: 50%; margin-bottom: 0px;">
                                            <asp:ListBox runat="server" ID="lbActOpinionID" class="btn-group bootstrap-select form-control show-tick"></asp:ListBox>
                                        </div>
                                        <div class="col-sm-6" style="margin-bottom: 0px;">
                                            <asp:Button ID="btnRemoveActOpinion" runat="server" OnClick="btnRemoveActOpinion_Click" Text="Remove Opinion" class="btn btn-block btn-lg bg-cyan" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# ACTIVITY OPINIONS -->
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

