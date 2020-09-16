<%@ Page Language="C#" AutoEventWireup="true" Inherits="ManageEntries" Codebehind="ManageEntries.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Raffle System - Manage Entries</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton PostBackUrl="~/ManageWinners.aspx" runat="server" Text="<< Back to Manage Winners Page"></asp:LinkButton>
        <h2>List of Raffle Entries:</h2>
        <asp:LinkButton PostBackUrl="~/AddEntry.aspx" runat="server">Add New Raffle Entry</asp:LinkButton><br /><br />
        <asp:GridView ID="grdEntries" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="sqldsEntries" PageSize="100">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Entry No." InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Employee" HeaderText="Name" SortExpression="Employee" />
                <asp:CheckBoxField DataField="ForGrandPrize" HeaderText="For Grand Prize?" SortExpression="ForGrandPrize" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" PostBackUrl='<%# "~/EditEntry.aspx?id=" + Eval("ID").ToString() %>'>Edit this Raffle Entry</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="sqldsEntries" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [Employees] ORDER BY [ID] DESC"></asp:SqlDataSource>
    </div>
        <br />
    </form>
</body>
</html>
