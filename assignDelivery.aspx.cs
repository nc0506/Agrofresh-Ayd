using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class assignDelivery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            FillCity();
        }
    }
    protected void gvCustomerList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gvCustomerList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
    protected void FillGrid()
    {

        DataSet Ds = new DataSet();
        DataTable dt = new DataTable();
        MainFunctions MF1 = new MainFunctions();
        order od = new order();

        try
        {
            od.FromDate = DateTime.Parse(txtStartDate.Text);
        }
        catch
        {
            od.FromDate = DateTime.Parse("1900-01-01 00:00:00.000");
        }
        try
        {
            od.Todate = DateTime.Parse(txtEndDate.Text);
        }
        catch
        {
            od.Todate = DateTime.Parse("1900-01-01 00:00:00.000");
        }
        od.City  = ddlCity.SelectedItem.ToString();
        dt = MF1.Edit(od, "AssignDelivery", od.FromDate, od.Todate, Session["UserName"].ToString());
        gvCustomerList.DataSource = dt;
        gvCustomerList.DataBind();


    }
    private void FillCity()
    {
        DataSet Ds = new DataSet();
        DataTable dt = new DataTable();
        MainFunctions MF1 = new MainFunctions();
        order od = new order();
        dt = MF1.GetAllList("CityList");
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "City";
        ddlCity.DataValueField = "ID";
        ddlCity.DataBind();
        ddlCity.Items.Insert(0, new ListItem("ALL"));

        
    }
    public void btnSelectAll_Click(object sender, EventArgs e)
    {
        //foreach(GridViewRow Row in gvCustomerList)
        //{ 
        
        //}
    }
    protected void btnAssign_Click(object sender, EventArgs e)
        {   
        if (txtDeliveryDate.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                  "alertScript", "alert('Please Select Delivery Date');", true);
        }
        int count = 0;
        foreach (GridViewRow row in gvCustomerList.Rows)
        {
           
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkEmployee = (CheckBox)row.FindControl("chkRow");
                if (chkEmployee.Checked)
                {
                    HiddenField ID = (HiddenField)row.FindControl("hdnID");
                     
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ConnectionString))
                    {
                      DateTime   DeliveryDate = DateTime.Parse(txtDeliveryDate.Text);
                        using (SqlCommand cmd = new SqlCommand("Update Agro_UniqueOrder set DeliveryDate=@DeliveryDate  Where ID=@ID", con))
                        {
                            cmd.Parameters.AddWithValue("@ID", ID.Value);
                            cmd.Parameters.AddWithValue("@DeliveryDate", DeliveryDate);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            count = count + 1;
                        }
                    }
                }
            }
        }
        if (count > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                     "alertScript", "alert('Delivery Date assign successfully');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                  "alertScript", "alert('Please Select Cust. To Assign Delivery Date');", true);
        }
    }
    protected void btnSearchdelivery_Click(object sender, EventArgs e)
    {
        if (txtDeliveryDate.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                  "alertScript", "alert('Please Select Delivery Date');", true);
        }
        if (ddlCity.SelectedItem.Text == "select")
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                   "alertScript", "alert('Please Select City');", true);
        }

        DataSet Ds = new DataSet();
        DataTable dt = new DataTable();
        MainFunctions MF1 = new MainFunctions();
        order od = new order();

        try
        {
            od.FromDate = DateTime.Parse(txtDeliveryDate.Text);
        }
        catch
        {
            od.FromDate = DateTime.Parse("1900-01-01 00:00:00.000");
        }
        try
        {
            od.Todate = DateTime.Parse(txtEndDate.Text);
        }
        catch
        {
            od.Todate = DateTime.Parse("1900-01-01 00:00:00.000");
        }
        od.City = ddlCity.SelectedItem.ToString();
        dt = MF1.Edit(od, "SearchByDelivery", od.FromDate, od.Todate, Session["UserName"].ToString());
        gvCustomerList.DataSource = dt;
        gvCustomerList.DataBind();

    }
    protected void btnstatusupdate_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (GridViewRow row in gvCustomerList.Rows)
        {

            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkEmployee = (CheckBox)row.FindControl("chkRow");
                if (chkEmployee.Checked)
                {
                    HiddenField ID = (HiddenField)row.FindControl("hdnID");

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ConnectionString))
                    {
                        string DeliveryStatus = ddlDeliveryStatus.SelectedItem.Text.ToString();
                        using (SqlCommand cmd = new SqlCommand("Update Agro_UniqueOrder set DeliveryStatus=@DeliveryStatus  Where ID=@ID", con))
                        {
                            cmd.Parameters.AddWithValue("@ID", ID.Value);
                            cmd.Parameters.AddWithValue("@DeliveryStatus", DeliveryStatus);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            count = count + 1;
                        }
                    }
                }
            }
        }
        if (count > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                     "alertScript", "alert('Delivery Status assign successfully');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                  "alertScript", "alert('Please Select Cust. To Assign Delivery Status');", true);
        }
    }
}