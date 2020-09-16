using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RAKSOCT_RAFFLE;

public partial class EditEntry : System.Web.UI.Page
{
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = int.Parse(Request.QueryString["id"].Trim());
            if (!IsPostBack)
            {
                loadData(id);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~");
        }
    }

    private void loadData(int id)
    {
        try
        {
            Employee e = Helpers.getEmployee(id);
            lblID.Text = e.ID.ToString();
            txtName.Text = e.Name;
            cbxForGrandPrize.Checked = e.ForGrandPrize;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            Helpers.updateEmployee(id, txtName.Text, cbxForGrandPrize.Checked);
            Response.Redirect("~/ManageEntries.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Something went wrong. Please try again later.');</script>");
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Helpers.deleteEmployee(id);
            Response.Redirect("~/ManageEntries.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Delete failed. Please make sure to delete the drawset in which this entry has been drawed.');</script>");
        }
    }
}