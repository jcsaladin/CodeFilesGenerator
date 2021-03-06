﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master/base.master" AutoEventWireup="true" CodeBehind="generator_connection.aspx.cs" Inherits="alpaul_gls.SGI.generator.generator_connection" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .connection {
            color: #0a0a0a;
            display: block;
            font-size: 0.875rem;
            line-height: 1.8;
            margin: 0;
            font-weight: 400;
        }

        .aspNetDisabled {
            background-color: #bcbcbc !important;
            border: 1px solid #3b3b3b;
            box-shadow: none;
            color: #0f0f0f;
        }

        .lblAuthentication {
            font-size: 16px;
        }

        .msg-error {
            margin-bottom: 20px;
            border-radius: 2px;
            border: 1px solid #dd7b74;
        }

        #progressBackgroundFilter {
            position: absolute;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding:;
            margin:;
            background-color: #000;
            filter: alpha(opacity=50);
            opacity: 0.5;
            z-index: 1000;
        }

        #processMessage {
            position: absolute;
            top: 30%;
            left: 43%;
            padding: 10px;
            width: 14%;
            z-index: 1001;
            background-color: #fff;
            border: 1px solid #666666;
            border-radius: 3px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">

    <%--  Form  --%>
    <div class="row">
        <div class="medium-12 columns">
            <h3><i class="step fi-align-justify size-29"></i>&nbsp;Data Base Connection</h3>
        </div>

        <asp:ScriptManager ID="sm" runat="server" />
        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <%-- Error Message --%>
                <div class="medium-12 columns">
                    <asp:ValidationSummary
                        ID="Summary"
                        runat="server"
                        HeaderText="Error(es):"
                        CssClass="msg-error" />
                </div>

                <%-- Conecction String Form --%>
                <div class="medium-6 columns">
                    <%-- Server Name --%>
                    <div class="medium-12">
                        <label>
                            Server Name:
                            <asp:DropDownList
                                runat="server"
                                ID="ddlServer"
                                TabIndex="0"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlServer_SelectedIndexChanged" />
                            <asp:RequiredFieldValidator
                                ID="rfvServer"
                                runat="server"
                                ErrorMessage="Select <strong>Server</strong>."
                                Display="None"
                                ControlToValidate="ddlServer"
                                InitialValue=""
                                SetFocusOnError="true" />
                        </label>
                    </div>

                    <%-- Server Authentication --%>
                    <div class="medium-12">
                        <fieldset>
                            <legend>
                                <strong>Log on to the server</strong>
                            </legend>
                            <div class="callout secondary">
                                <div class="row">
                                    <div class="small-3 columns"></div>
                                    <div class="small-9 columns">
                                        <asp:RadioButton
                                            runat="server"
                                            ID="rdbWinAuthentication"
                                            TabIndex="1"
                                            GroupName="Authentication"
                                            Checked="true"
                                            OnCheckedChanged="rAuthentication_CheckedChanged"
                                            AutoPostBack="True" />
                                        <label
                                            for="rdbWinAuthentication"
                                            class="lblAuthentication">
                                            Use Windows Authentication
                                        </label>

                                        <br />
                                        <asp:RadioButton
                                            runat="server"
                                            ID="rdbSerAuthentication"
                                            TabIndex="2"
                                            GroupName="Authentication"
                                            OnCheckedChanged="rAuthentication_CheckedChanged"
                                            AutoPostBack="True" />
                                        <label
                                            for="rdbSerAuthentication"
                                            class="lblAuthentication">
                                            Use SQL Server Authentication
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="small-3 columns">
                                        <label
                                            for="txtUserName"
                                            class="middle text-right">
                                            User Name
                                        </label>
                                    </div>
                                    <div class="small-9 columns">
                                        <asp:TextBox
                                            runat="server"
                                            ID="txtUserName"
                                            Enabled="false"
                                            placeholder="Type User Name"
                                            AutoPostBack="true"
                                            OnTextChanged="UserName_TextChanged" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="small-3 columns">
                                        <label
                                            for="txtPassword"
                                            class="middle text-right">
                                            Password
                                        </label>
                                    </div>
                                    <div class="small-9 columns">
                                        <asp:TextBox
                                            runat="server"
                                            ID="txtPassword"
                                            Enabled="false"
                                            placeholder="Type Password"
                                            AutoPostBack="true"
                                            OnTextChanged="Passwword_TextChanged" />
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <%-- Server Database --%>
                    <div class="medium-12 body">
                        <fieldset>
                            <legend>
                                <strong>Connect to a database</strong>
                            </legend>

                            <label for="checkbox1">
                                <asp:RadioButton runat="server" ID="rdbDataBase" Checked="true" />
                                Select or enter a database name:
                            </label>
                            <div class="medium-12">
                                <label>
                                    <asp:DropDownList
                                        runat="server"
                                        ID="ddlDataBase"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlDataBase_SelectedIndexChanged" />
                                    <asp:RequiredFieldValidator
                                        ID="rfvDataBase"
                                        runat="server"
                                        ErrorMessage="Select <strong>Data Base</strong>."
                                        Display="None"
                                        ControlToValidate="ddlDataBase"
                                        InitialValue=""
                                        SetFocusOnError="true" />
                                </label>
                            </div>
                        </fieldset>
                    </div>

                    <%-- Button --%>
                    <div class="medium-12">
                        <asp:Button runat="server" ID="btnTestConecction" CssClass="button hollow" Text="Test Connection" OnClick="btnTestConecction_Click" />
                        <asp:Button runat="server" ID="btnContinue" CssClass="button" Text="Continue" OnClick="btnContinue_Click" />
                    </div>
                </div>

                <%-- Conecction String Viewer --%>
                <div class="medium-6 columns">
                    <div class="connection">
                        &nbsp;
                    <div class="panel callout radius">
                        <h5>Conecction String</h5>
                        <p>
                            <asp:Label runat="server" ID="lblConecction" />
                        </p>
                    </div>
                    </div>
                </div>

                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div id="progressBackgroundFilter"></div>
                        <div id="processMessage">                         
                            <img alt="Loading" src="/img/loader2.gif" />
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlServer" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlDataBase" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtUserName" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtPassword" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="rdbWinAuthentication" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="rdbSerAuthentication" EventName="CheckedChanged" />
            </Triggers>

        </asp:UpdatePanel>


    </div>
</asp:Content>
