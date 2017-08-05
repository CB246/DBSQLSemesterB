<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="aspx_SignedFor_Add" %>

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
            <!-- CHOOSE A KID -->
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
                                <asp:RadioButtonList ID="rblKids" runat="server" Width="100%" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblKids_SelectedIndexChanged">
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- CHOOSE A ACTIVITY -->
            <div class="container-fluid col-lg-12" runat="server" id="activity">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2 class="align-center">Add Kid page
                                <small>Here you can add your kid to Activity</small>
                                </h2>
                            </div>
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbActID" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Activity ID</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbActName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Activity Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbOperLastName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Operator Last Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbOperFirstName" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Operator First Name</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbDayInWeek" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Activity Day</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbstartTime" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Start Time</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbEndTime" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">End Time</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <asp:TextBox ID="tbCost" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                <label class="form-label">Cost</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <asp:Button ID="btnPrevActivity" runat="server" OnClick="btnPrevActivity_Click" Text="Previous" class="btn btn-lg bg-cyan col-sm-3 m-l-15" />
                                    <asp:Button ID="btnNextActivity" runat="server" OnClick="btnNextActivity_Click" Text="Next" class="btn btn-lg bg-cyan col-sm-3 pull-right m-r-15" />
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-12" style="margin-bottom: 0px;">
                                        <asp:Button ID="btnAddKidToActivity" runat="server" OnClick="btnAddKidToActivity_Click" ValidationGroup="longLat" Text="Add Kid to Activity" class="btn btn-block btn-lg bg-cyan" />
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
                                <h2 class="align-center">Add Kid page
                                <small>Here you can rewiev all charts</small>
                                </h2>
                            </div>
                            <div class="body">
                                <iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
                                <canvas id="bar_chart" height="228" width="457" style="display: block; width: 457px; height: 228px;"></canvas>
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
                                <h2 class="align-center">Add Kid page
                                <small>Here you can rewiev all opinions</small>
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

