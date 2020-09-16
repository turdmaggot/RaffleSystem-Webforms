<%@ Page Language="C#" AutoEventWireup="true" Inherits="EditEntry" Codebehind="EditEntry.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="LinkButton1" PostBackUrl="~/ManageEntries.aspx" runat="server" Text="<< Back to Manage Raffle Entries"></asp:LinkButton>
        <h2>Edit Raffle Entry</h2>
        Entry Number: <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label><br /><br />
        Name: <asp:TextBox ID="txtName" runat="server" required></asp:TextBox><br /><br />
        For Grand Prize? <asp:CheckBox ID="cbxForGrandPrize" runat="server" /><br /><br />

        <asp:Button ID="btnUpdate" runat="server" Text="Update this Raffle Entry" OnClick="btnUpdate_Click" /><br /><br />
        <asp:Button ID="btnDelete" runat="server" Text="Delete this Raffle Entry" OnClick="btnDelete_Click" ForeColor="White" BackColor="Red" />
    </div>
    </form>
</body>
</html>
