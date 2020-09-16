using RAKSOCT_RAFFLE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageWinners : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlSelectSet_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedSet = ddlSelectSet.SelectedValue;

        if (selectedSet != "")
        {
            sqldsWinners.SelectCommand = "SELECT a.ID, a.Employee FROM Employees a INNER JOIN Winners b ON a.ID=b.ID WHERE b.SetID=" + selectedSet;
            GridView1.DataBind();
            btnDeleteSet.Visible = true;
        }
        else
        {
            sqldsWinners.SelectCommand = "";
            GridView1.DataBind();
            btnDeleteSet.Visible = false;
        }

    }
    protected void btnDeleteSet_Click(object sender, EventArgs e)
    {
        try
        {
            int selectedSet = int.Parse(ddlSelectSet.SelectedValue);
            Helpers.deleteDrawSet(selectedSet);

            Response.Redirect("~/ManageWinners.aspx");

            //sqldsWinners.SelectCommand = "";
            //GridView1.DataBind();
            //btnDeleteSet.Visible = false;

            //ddlSelectSet.Items.Remove(ddlSelectSet.SelectedValue);
            //Response.Write("<script>alert('Draw deleted!');</script>");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnFlushDB_Click(object sender, EventArgs e)
    {
        try
        {
            Helpers.flushRaffleDB();
            Response.Redirect("~/ManageWinners.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}