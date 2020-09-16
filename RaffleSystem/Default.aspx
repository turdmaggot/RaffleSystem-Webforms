<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Default" CodeBehind="Default.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Raffle Draw</title>


    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <style>
        @font-face {
            font-family: 'Gotham-Medium';
            src: url('fonts/Gotham-Medium.eot?#iefix') format('embedded-opentype'), url('fonts/Gotham-Medium.otf') format('opentype'), url('fonts/Gotham-Medium.woff') format('woff'), url('fonts/Gotham-Medium.ttf') format('truetype'), url('fonts/Gotham-Medium.svg#Gotham-Medium') format('svg');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'GothamRounded-Bold';
            src: url('fonts/GothamRounded-Bold.eot?#iefix') format('embedded-opentype'), url('fonts/GothamRounded-Bold.otf') format('opentype'), url('fonts/GothamRounded-Bold.woff') format('woff'), url('fonts/GothamRounded-Bold.ttf') format('truetype'), url('fonts/GothamRounded-Bold.svg#GothamRounded-Bold') format('svg');
            font-weight: normal;
            font-style: normal;
        }

        h1 {
            font-family: 'GothamRounded-Bold', sans-serif;
            font-size: 65px;
            font-weight: normal;
            color: #ac0014;
        }

        .wrapper {
            text-align: center;
        }

        .raffle-btn-bg {
            margin-top: 10%;
        }

        .manage-winners {
            width: 123px;
            height: 18px;
            margin: 0;
            text-decoration: none;
            color: #fff;
            background: #262262;
            padding: 10px 20px;
            position: absolute;
            top: 20px;
            right: 20px;
            font-family: 'Gotham-Medium', sans-serif;
            font-size: 12px;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
            border-radius: 15px;
            -webkit-transition: all .25s ease-in-out;
            -moz-transition: all .25s ease-in-out;
            -ms-transition: all .25s ease-in-out;
            transition: all .25s ease-in-out;
            opacity: .5;
        }

            .manage-winners:hover {
                opacity: 1;
            }

        .draw-btn {
            font-family: 'Gotham-Medium', sans-serif;
            font-size: 30px;
            padding: 10px 20px;
            color: #fff;
            background: #148621;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
            border-radius: 15px;
            cursor: pointer;
            border: none;
            -webkit-transition: all .25s ease-in-out;
            -moz-transition: all .25s ease-in-out;
            -ms-transition: all .25s ease-in-out;
            transition: all .25s ease-in-out;
        }

            .draw-btn:hover {
                background: #1dc130;
            }
    </style>
</head>
<body style="background-image: url('../img/bg.jpg');">



    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="wrapper">


            <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <asp:Image runat="server" ImageUrl="~/img/loading.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>


                    <asp:Panel ID="Panel1" runat="server" CssClass="raffle-btn-bg">

                        <h1>RAFFLE DRAW</h1>
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="sqldsEmployees">

                            <EmptyDataTemplate>
                                <span></span>
                                <br />
                                <br />
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <li>
                                    <asp:Label ID="EmployeeLabel" runat="server" Text='<%# Eval("Employee").ToString().ToUpper() %>' /></li>

                            </ItemTemplate>
                            <LayoutTemplate>
                                <h3>
                                    <ol id="itemPlaceholderContainer" runat="server" style="list-style-position: inside;">
                                        <li runat="server" id="itemPlaceholder"></li>
                                    </ol>
                                </h3>
                            </LayoutTemplate>

                        </asp:ListView>

                        <asp:SqlDataSource ID="sqldsEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand=""></asp:SqlDataSource>
                        <asp:Button ID="btnDraw5" runat="server" Text="Draw 5 Winners" OnClick="btnDraw5_Click" CssClass="draw-btn" />
                        <asp:Button ID="btnDraw10" runat="server" Text="Draw 10 Winners" OnClick="btnDraw10_Click" CssClass="draw-btn" />
                        <asp:Button ID="btnDraw1" runat="server" Text="Draw 1 Winner" OnClick="btnDraw1_Click" CssClass="draw-btn" />

                        <br />
                        <br />

                        <asp:Button ID="btnDraw1Grand" runat="server" Text="Draw 1 Grand Prize Winner" OnClick="btnDraw1Grand_Click" CssClass="draw-btn" />

                        <br />
                        <br />

                        <a href="ManageWinners.aspx" class="manage-winners"><i class="fa fa-cog" aria-hidden="true"></i>Manage Winners</a>
                    </asp:Panel>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnDraw5" />
                    <asp:PostBackTrigger ControlID="btnDraw10" />
                    <asp:PostBackTrigger ControlID="btnDraw1" />
                    <asp:PostBackTrigger ControlID="btnDraw1Grand" />
                </Triggers>
            </asp:UpdatePanel>


        </div>
    </form>

</body>
</html>
