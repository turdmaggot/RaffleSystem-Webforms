<%@ Page Language="C#" AutoEventWireup="true" Inherits="ManageWinners" Codebehind="ManageWinners.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       
        <center>
             <h1>See All Winners</h1>
        Draw Set: <asp:DropDownList ID="ddlSelectSet" runat="server" AppendDataBoundItems="True" DataSourceID="sqldsSets" DataTextField="Disp" DataValueField="SetID" AutoPostBack="True" OnSelectedIndexChanged="ddlSelectSet_SelectedIndexChanged">
             <asp:ListItem Text="- SELECT -" Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="sqldsSets" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand=" SELECT SetID, CONVERT(nvarchar, DateDraw) + ' (' + CONVERT(nvarchar, NoOfWinners) + ' Winners)' AS Disp FROM DrawSets  "></asp:SqlDataSource>
        <br />
        <%--<br />
        <strong>Winners on the selected set:
        </strong>--%>
        <br />  <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="sqldsWinners" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" EmptyDataText="-SELECT DRAW SET-">
            <Columns>
                <%--<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />--%>
                <asp:BoundField DataField="Employee" HeaderText="Winners" SortExpression="Employee" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="sqldsWinners" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand=""></asp:SqlDataSource>

            <br />
            <asp:Button ID="btnDeleteSet" runat="server" Text="Delete This Draw" OnClick="btnDeleteSet_Click" Visible ="false"></asp:Button>
           

            <br /><br />
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx">&lt;&lt; Back to Raffle</asp:LinkButton>
             <br /> <br /><br />
            <strong>WARNING: DON'T PRESS THE RED BUTTON UNLESS YOU ARE SUPER SURE!!!</strong><br />
            <asp:Button ID="btnFlushDB" runat="server" Text="! Delete all draws !" ForeColor="White" BackColor="Red" OnClick="btnFlushDB_Click"></asp:Button><br /><br /><br /><br /><br />
            <asp:Button ID="btnManageEntries" PostBackUrl="~/ManageEntries.aspx" runat="server" Text="! Manage raffle entries here !" ForeColor="White" BackColor="Green" OnClick="btnFlushDB_Click"></asp:Button>
            </center>
            </div>
    </form>
</body>
</html>
