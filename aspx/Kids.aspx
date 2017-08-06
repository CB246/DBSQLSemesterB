<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kids.aspx.cs" Inherits="aspx_Kids" %>

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
        <div class="container-fluid">
            <!-- Tabs With Custom Animations -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2 class="align-center">Kids managment page
                                <small>Here you can add to or remove from a system your kid, or change his information</small>
                            </h2>
                        </div>
                        <form runat="server">
                            <div class="body">
                                <div class="row clearfix">
                                    <div class="col-xs-12 col-lg-12" style="margin-bottom: 0px;">
                                        <!-- Nav tabs -->
                                        <div class="nav-tabs btn-group btn-group-justified" role="group" aria-label="Justified button group">
                                            <a href="#add" runat="server" id="addTabButton" class="btn bg-cyan waves-effect" role="presentation" data-toggle="tab">ADD</a>
                                            <asp:HyperLink ID="HyperLink1" runat="server" class="btn bg-cyan waves-effect" NavigateUrl="#add" data-toggle="tab">PUBLIC KINDERGARDEN</asp:HyperLink>
                                            <a href="#change" runat="server" id="changeTabButton" class="btn bg-cyan waves-effect" data-toggle="tab">CHANGE</a>
                                            <a href="#remove" runat="server" id="removeTabButton" class="btn bg-cyan waves-effect" data-toggle="tab">REMOVE</a>
                                        </div>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane animated fadeInRight" id="add">
                                                <b>Home Content</b>
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
                                                <div class="row clearfix" style="border-bottom: 1px solid rgba(204, 204, 204, 0.35);">
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
                                                <div class="col-xs-12 col-lg-12" id="tgKindergardens" runat="server" visible="false" style="margin-bottom: 0px; margin-top: 10px;">
                                                    <!-- Nav Kindergardens tabs -->
                                                    <div class="nav-tabs btn-group btn-group-justified" role="group" aria-label="Justified button group">
                                                        <asp:HyperLink ID="hlPublic" runat="server" class="btn bg-cyan waves-effect" NavigateUrl="#public" data-toggle="tab">PUBLIC KINDERGARDEN</asp:HyperLink>
                                                        <asp:HyperLink ID="hpPrivate" runat="server" class="btn bg-cyan waves-effect" NavigateUrl="#private" data-toggle="tab">PRIVATE KINDERGARDEN</asp:HyperLink>
                                                    </div>
                                                    <!-- Kindergardens Tabs content-->
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane animated jello" id="public">
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
                                                        <!-- PRIVATE KINDERGARDEN -->
                                                        <div role="tabpanel" class="tab-pane animated jello" id="private">
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
                                                                    <div class="progress p-l-0 m-b-0">
                                                                        <div id="divProgressPrivate" runat="server" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width: 20%"></div>
                                                                    </div>
                                                                    <div class="help-info align-center" style="font-size: 12px; margin-top: 5px; color: #999;">
                                                                        <asp:Label ID="lblProgressPrivate" runat="server" Text=""></asp:Label>
                                                                    </div>
                                                                </div>
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
                                            <div role="tabpanel" class="tab-pane animated fadeInRight" id="change">
                                                <b>Profile Content</b>
                                                
                                            </div>
                                            <div role="tabpanel" class="tab-pane animated fadeInRight" id="remove">
                                                <b>Message Content</b>
                                                <div class="col-sm-12" style="margin-bottom: 0px;">
                                                    <asp:RadioButtonList ID="rblKids" runat="server" Width="100%" RepeatDirection="Horizontal">
                                                    </asp:RadioButtonList>
                                                </div>
                                                <div class="col-sm-4" style="margin-bottom: 0px;">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control">
                                                            <label class="form-label">ID (9 digits)</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4" style="margin-bottom: 0px;">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control">
                                                            <label class="form-label">Last Name</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4" style="margin-bottom: 0px;">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control">
                                                            <label class="form-label">First Name</label>
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
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="defaultModalLabel">Modal title</h4>
                                        </div>
                                        <div class="modal-body align-center">
                                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link waves-effect">SAVE CHANGES</button>
                                            <asp:Button class="btn btn-link waves-effect" runat="server" ID="cancelButton" OnClick="cancelButton_Click" Text="CLOSE EPTA" />
                                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- #END# Tabs With Custom Animations -->
        </div>
    </section>
</asp:Content>

