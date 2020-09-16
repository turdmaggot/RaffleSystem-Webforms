using RAKSOCT_RAFFLE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEntry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Helpers.insertEmployee(txtName.Text, cbxForGrandPrize.Checked);
            Response.Redirect("~/ManageEntries.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Something went wrong. Please try again later.');</script>");
        }
    }
}