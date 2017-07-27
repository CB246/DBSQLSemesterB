<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kids.aspx.cs" Inherits="aspx_Kids" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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
                                            <a href="#add" class="btn bg-cyan waves-effect" role="presentation" data-toggle="tab">ADD</a>
                                            <a href="#change" class="btn bg-cyan waves-effect" data-toggle="tab">CHANGE</a>
                                            <a href="#remove" class="btn bg-cyan waves-effect" data-toggle="tab">REMOVE</a>
                                        </div>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane animated fadeInRight active" id="add">
                                                <b>Home Content</b>
                                                <div class="row clearfix">
                                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                                        <div class="form-group form-float">
                                                            <div class="form-line">
                                                                <asp:TextBox ID="tbID" class="form-control" runat="server"></asp:TextBox>
                                                                <label class="form-label">ID (9 digits)</label>
                                                            </div>
                                                            <asp:RegularExpressionValidator ID="IDRegExVal" runat="server" ErrorMessage="ID must be 9 digits" Display="Dynamic" ValidationGroup="longLat" CssClass="val-err-msg" ValidationExpression="[0-9]{9}"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="IDReqVal" runat="server" Display="Dynamic" ErrorMessage="ID is empty" ValidationGroup="longLat" CssClass="val-err-msg"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                                        <div class="form-group form-float">
                                                            <div class="form-line">
                                                                <asp:TextBox ID="tbLastName" class="form-control" runat="server"></asp:TextBox>
                                                                <label class="form-label">Last Name</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                                        <div class="form-group form-float">
                                                            <div class="form-line">
                                                                <asp:TextBox ID="tbFirstName" class="form-control" runat="server"></asp:TextBox>
                                                                <label class="form-label">First Name</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3" style="margin-bottom: 0px;">
                                                        <div class="form-group form-float">
                                                            <div class="form-line">
                                                                <asp:TextBox ID="tbDOB" Width="72%" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                                                                <label class="form-label">Date of Birth</label>
                                                            </div>
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
                                                            <asp:RequiredFieldValidator ID="cityVal" runat="server" ValidationGroup="longLat" Display="Dynamic" ControlToValidate="tbCity" class="val-err-msg" ErrorMessage="City is empty"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                                        <div class="form-group form-float">
                                                            <div class="form-line">
                                                                <asp:TextBox ID="tbStreet" class="form-control" runat="server"></asp:TextBox>
                                                                <label class="form-label">Street</label>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="streetVal" runat="server" ValidationGroup="longLat" Display="Dynamic" ControlToValidate="tbStreet" class="val-err-msg" ErrorMessage="Street is empty"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4" style="margin-bottom: 0px;">
                                                        <div class="form-group form-float">
                                                            <div class="form-line">
                                                                <asp:TextBox ID="tbHouseNumber" class="form-control" runat="server"></asp:TextBox>
                                                                <label class="form-label">House Number</label>
                                                            </div>
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
                                                                <div class="col-sm-6" style="margin-bottom: 0px;">
                                                                    <div class="form-group form-float">
                                                                        <div class="form-line">
                                                                            <asp:TextBox ID="tbKgID" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                                            <label class="form-label">Kindergarden ID</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6" style="margin-bottom: 0px;">
                                                                    <div class="form-group form-float">
                                                                        <div class="form-line">
                                                                            <asp:TextBox ID="tbClassNum" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                                            <label class="form-label">Class num</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row clearfix">
                                                                <div class="col-sm-12" style="margin-bottom: 0px;">
                                                                    <asp:Button ID="btnAddKidToPublic" runat="server" OnClick="btnAddKidToPublic_Click" ValidationGroup="add" Text="Add Kid to Kindergarden" class="btn btn-block btn-lg bg-cyan" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane animated jello" id="private">
                                                            private KG<br />
                                                            *   get all private kindergardens with available slots in right class<br />
                                                            *   show all kindergardens & classes<br />
                                                            *   let parent choose a KG & class
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane animated fadeInRight" id="change">
                                                <b>Profile Content</b>
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
                                            <div role="tabpanel" class="tab-pane animated fadeInRight" id="remove">
                                                <b>Message Content</b>
                                                <p>
                                                    Lorem ipsum dolor sit amet, ut duo atqui exerci dicunt, ius impedit mediocritatem an. Pri ut tation electram moderatius.
                                                Per te suavitate democritum. Duis nemore probatus ne quo, ad liber essent
                                                aliquid pro. Et eos nusquam accumsan, vide mentitum fabellas ne est, eu munere
                                                gubergren sadipscing mel.
                                                </p>
                                            </div>
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

