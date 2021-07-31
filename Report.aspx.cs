using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime dts;
            dts = (DateTime.Now.Date);
            txtStartDate.Text = dts.ToString("dd/MM/yyyy");
            txtEndDate.Text = dts.ToString("dd/MM/yyyy");

            FillMOP();
            FillGrid();
        }
    }

    protected void btnDump_Click(object sender, EventArgs e)
    {
        Dump_Report();
    }
    protected void Dump_Report()
    {
        DataTable dt = FillHistory_CMS(Session["UserName"].ToString());
        ExportToExcel("Dump report.xls", dt);


    }
    private DataTable FillHistory_CMS(string Username)
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

        dt = MF1.Edit(od, "DumpReport", od.FromDate, od.Todate, Username);
       

        return dt;
    }

    private void ExportToExcel(string strFileName, DataTable dtTemp)
    {
        DataGrid dg = new DataGrid();
        dg.HeaderStyle.Font.Bold = true;
        dg.HeaderStyle.ForeColor = System.Drawing.Color.Blue;
        dg.ItemStyle.ForeColor = System.Drawing.Color.Black;
        dg.DataSource = dtTemp;
        dg.DataBind();
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment; filename=" + strFileName);
        Response.ContentType = "application/excel";
        System.IO.StringWriter sw = new System.IO.StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        dg.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable dt = unique(Session["UserName"].ToString());
        ExportToExcel("Unique report.xls", dt);
    }

    private DataTable unique( String Username)
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

        dt = MF1.Edit(od, "Unique", od.FromDate, od.Todate, Username);


        return dt;
    }


    protected void btnView_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
    protected void FillGrid()
    {
        try
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
        od.MOP = ddlModeOfPayment.SelectedItem.ToString();
        dt = MF1.Edit(od, "View_Unique", od.FromDate, od.Todate, Session["UserName"].ToString());
        gvReportList.DataSource = dt;
        gvReportList.DataBind();


        }
        catch
        {

        }
    }
    private void FillMOP()
    {
        DataSet Ds = new DataSet();
        DataTable dt = new DataTable();
        MainFunctions MF1 = new MainFunctions();
        order od = new order();
        dt = MF1.GetAllList("MOPLIST");
        ddlModeOfPayment.DataSource = dt;
        ddlModeOfPayment.DataTextField = "MOP";
        ddlModeOfPayment.DataValueField = "ID";
        ddlModeOfPayment.DataBind();
        ddlModeOfPayment.DataSource = dt;

         
    }
}