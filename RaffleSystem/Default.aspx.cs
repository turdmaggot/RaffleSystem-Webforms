using RAKSOCT_RAFFLE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDraw1_Click(object sender, EventArgs e)
    {
        try
        {
            int setID;
            Helpers.drawWinners(1, Helpers.ALL, out setID);
            sqldsEmployees.SelectCommand = "SELECT a.ID, a.Employee FROM Employees a INNER JOIN Winners b ON a.ID=b.ID WHERE b.SetID=" + setID.ToString();
            ListView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnDraw5_Click(object sender, EventArgs e)
    {
        try
        {
            //added a 3-second delay
            System.Threading.Thread.Sleep(3000);

            int setID;
            Helpers.drawWinners(5, Helpers.NEW_ONLY, out setID);
            sqldsEmployees.SelectCommand = "SELECT a.ID, a.Employee FROM Employees a INNER JOIN Winners b ON a.ID=b.ID WHERE b.SetID=" + setID.ToString();
            ListView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnDraw10_Click(object sender, EventArgs e)
    {
        try
        {
            int setID;
            Helpers.drawWinners(10, Helpers.OLD_ONLY, out setID);
            sqldsEmployees.SelectCommand = "SELECT a.ID, a.Employee FROM Employees a INNER JOIN Winners b ON a.ID=b.ID WHERE b.SetID=" + setID.ToString();
            ListView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnDraw1Grand_Click(object sender, EventArgs e)
    {
        try
        {
            int setID;
            Helpers.drawWinners(1, Helpers.OLD_ONLY, out setID);
            sqldsEmployees.SelectCommand = "SELECT a.ID, a.Employee FROM Employees a INNER JOIN Winners b ON a.ID=b.ID WHERE b.SetID=" + setID.ToString();
            ListView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}