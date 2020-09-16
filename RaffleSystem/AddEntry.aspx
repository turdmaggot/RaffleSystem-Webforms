<%@ Page Language="C#" AutoEventWireup="true" Inherits="AddEntry" Codebehind="AddEntry.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton PostBackUrl="~/ManageEntries.aspx" runat="server" Text="<< Back to Manage Raffle Entries"></asp:LinkButton>
        <h2>Add New Raffle Entry</h2>
        
        Name: <asp:TextBox ID="txtName" runat="server" MaxLength="150" required></asp:TextBox><br /><br />
        For Grand Prize? <asp:CheckBox ID="cbxForGrandPrize" runat="server" /><br /><br />

        <asp:Button ID="btnAdd" runat="server" Text="Add Raffle Entry" OnClick="btnAdd_Click" />

    </div>
    </form>
</body>
</html>
