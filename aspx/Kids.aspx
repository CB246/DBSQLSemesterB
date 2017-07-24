<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kids.aspx.cs" Inherits="aspx_Kids" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <section class="content">
        <div class="container-fluid">
            <!-- Tabs With Custom Animations -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2 class="align-center">Kids managment page
                                <small>Here you can add or remove a kid from a system, or change his information</small>
                            </h2>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 col-lg-12">
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
                                            <p>
                                                Lorem ipsum dolor sit amet, ut duo atqui exerci dicunt, ius impedit mediocritatem an. Pri ut tation electram moderatius.
                                                Per te suavitate democritum. Duis nemore probatus ne quo, ad liber essent
                                                aliquid pro. Et eos nusquam accumsan, vide mentitum fabellas ne est, eu munere
                                                gubergren sadipscing mel.
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane animated fadeInRight" id="change">
                                            <b>Profile Content</b>
                                            <p>
                                                Lorem ipsum dolor sit amet, ut duo atqui exerci dicunt, ius impedit mediocritatem an. Pri ut tation electram moderatius.
                                                Per te suavitate democritum. Duis nemore probatus ne quo, ad liber essent
                                                aliquid pro. Et eos nusquam accumsan, vide mentitum fabellas ne est, eu munere
                                                gubergren sadipscing mel.
                                            </p>
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
                    </div>
                </div>
            </div>
            <!-- #END# Tabs With Custom Animations -->
        </div>
    </section>
</asp:Content>

