<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- Bootstrap Core Css -->
    <link href="/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <link href="/plugins/morrisjs/morris.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="/css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="/css/themes/all-themes.css" rel="stylesheet" />

    <!-- ============================================ -->

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

    <script>
        function fillCharts(a, b, c, d, e, f) {
            new Chart(document.getElementById("bar_chart_kg").getContext("2d"), getChartJs('bar', a, b, c));
            new Chart(document.getElementById("bar_chart_act").getContext("2d"), getChartJs('bar', d, e, f));
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
                            label: "Num of kids in",
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
            <div class="container-fluid">
                <div class="block-header">
                    <h2>DASHBOARD</h2>
                </div>

                <!-- Widgets -->
                <div class="row clearfix">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-pink hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">playlist_add_check</i>
                            </div>
                            <div class="content">
                                <div class="text">NEW TASKS</div>
                                <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-cyan hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">help</i>
                            </div>
                            <div class="content">
                                <div class="text">NEW TICKETS</div>
                                <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-light-green hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">forum</i>
                            </div>
                            <div class="content">
                                <div class="text">NEW COMMENTS</div>
                                <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-orange hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">person_add</i>
                            </div>
                            <div class="content">
                                <div class="text">NEW VISITORS</div>
                                <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Widgets -->
                <div class="container-fluid col-lg-6" runat="server" id="charts">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">
                                <div class="header">
                                    <h2 class="align-center">KINDERGARDENS REVIEW
                                    </h2>
                                </div>
                                <div class="body">
                                    <canvas id="bar_chart_kg"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid col-lg-6" runat="server" id="Div1">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">
                                <div class="header">
                                    <h2 class="align-center">ACTIVITY REVIEW
                                    </h2>
                                </div>
                                <div class="body">
                                    <canvas id="bar_chart_act"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>

</asp:Content>

