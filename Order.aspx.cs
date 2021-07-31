using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    int count = 0;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string path = HttpContext.Current.Request.Url.AbsolutePath + "/" + Session["ADMIN"];
           // Response.Redirect(path);
        }
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        fillgrd();  
    }
    protected void fillgrd()
    {
        MainFunctions SA = new MainFunctions();
        Customer Cust = new Customer();
        dt = SA.Search(Cust, "Search", txtFirstname.Text, txtLastname.Text, txtMobileNO.Text, txtAlternate.Text, Session["UserName"].ToString());
        gvCustomerList.DataSource = dt;
        gvCustomerList.DataBind();
    }

    protected void gvCustomerList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        
       
        gvCustomerList.PageIndex = e.NewPageIndex;

        fillgrd();

    }
    protected void gvCustomerList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

        int rowIndex = Convert.ToInt32(e.CommandArgument);

        //Reference the GridView Row.
        GridViewRow row = gvCustomerList.Rows[rowIndex];

        //Fetch value of Name.
        txtfname.Text = (row.FindControl("CustID") as Label).Text;
       txtlname.Text = (row.FindControl("FirstName") as Label).Text+" "+ (row.FindControl("LastName") as Label).Text;
       txtmob.Text = (row.FindControl("MobileNo") as Label).Text;
       txtaltmob.Text = (row.FindControl("AltContactNo") as Label).Text;
        //Fetch value of Country

        string country = gvCustomerList.Rows[rowIndex].Cells[1].Text;

        trsearchlabel.Visible = false;
        trsearchlabel4.Visible = false;
        trsearchlabel2.Visible = false;
        trsearchlabel1.Visible = false;
        trsearchlabel3.Visible = false;

        trselectedcustomer5.Visible = true;
        trselectedcustomer2.Visible = true;
        trselectedcustomer1.Visible = true;
        grvStudentDetails.DataSource = null;
        grvStudentDetails.DataBind();

        }
        catch
        {
        }
         
    }
    protected void btnPlaceorder_Click(object sender, EventArgs e)
    {
         grdorderhide.Visible  = true;
        GetOrderType();
        GetProductType();
        FirstGridViewRow();
    }

    protected void GetProductType()
    {
        MainFunctions SA = new MainFunctions();
       Bindddl(ddlProductType,"ProductType","ProductTypeID",SA.GetList("GetProductType", null,null,null));
        
    }
    protected void Getproduct()
    {
        MainFunctions SA = new MainFunctions();
        int? ProductTypeID=null;
        try{ ProductTypeID=Convert.ToInt32(ddlProductType.SelectedValue);}catch{  ProductTypeID=null;}
        Bindddl(ddlProductName, "ProductName", "ProductID", SA.GetList("GetProduct", ProductTypeID, null,null));

        
    }
    protected void GetOrderType()
    {
        MainFunctions SA = new MainFunctions();
       Bindddl(ddlOrderType, "OrderType", "OrderTypeID",SA.GetList("GetOrderType",null,null,null));
        
    }

    protected void GetRate()
    {
        MainFunctions SA = new MainFunctions();
        dt = SA.GetList("getRate", null, Convert.ToInt32(ddlProductName.SelectedValue),null);
       lblPerquantity.Text = dt.Rows[0]["Rate"].ToString();
       lblunit.Text = dt.Rows[0]["UnitType"].ToString();
       lblPer.Text = "Per";

    }
    protected void Bindddl(DropDownList ddl,string Key,string value,DataTable dt)
    {
            ddl.DataSource = dt;
            ddl.DataTextField = Key;
            ddl.DataValueField = value;
            ddl.DataBind();
            if (ddl.Text != "ddlOrderType")
            ddl.Items.Insert(0, new ListItem("select"));
    }

    protected void ddlProductType_SelectedIndexChanged(object sender, EventArgs e)
    {
          
        Getproduct();
    }
    protected void ddlProductName_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetRate();
    }
    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
       // if (lblunit.Text == "gm")
        //{
            txtTotal.Text = (double.Parse(lblPerquantity.Text) * double.Parse(txtQuantity.Text)).ToString();
    //}
        //else if (lblunit.Text == "bunch")
        //{ txtTotal.Text = (double.Parse(lblPerquantity.Text) * 1000).ToString(); }
        //else if (lblunit.Text == "dozzen")
        //{ txtTotal.Text = (double.Parse(lblPerquantity.Text) * 1000).ToString(); }
        //else if (lblunit.Text == "piece")
        //{ txtTotal.Text = (double.Parse(lblPerquantity.Text) * 1000).ToString(); }
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }
    private void FirstGridViewRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("Col1", typeof(string)));
        dt.Columns.Add(new DataColumn("Col2", typeof(string)));
        dt.Columns.Add(new DataColumn("Col3", typeof(string)));
        dt.Columns.Add(new DataColumn("Col4", typeof(string)));
        dt.Columns.Add(new DataColumn("Col5", typeof(string)));
        dt.Columns.Add(new DataColumn("Col6", typeof(string)));
        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["Col1"] = string.Empty;
        dr["Col2"] = string.Empty;
        dr["Col3"] = string.Empty;
        dr["Col4"] = string.Empty;
        dr["Col5"] = string.Empty;
        dr["Col6"] = "0";
        dt.Rows.Add(dr);

        ViewState["CurrentTable"] = dt;


        grvStudentDetails.DataSource = dt;
        grvStudentDetails.DataBind();

        Button btnAdd = (Button)grvStudentDetails.FooterRow.Cells[5].FindControl("ButtonAdd");
        Page.Form.DefaultFocus = btnAdd.ClientID;


    }
    private void AddNewRow()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    DropDownList ddlOrderTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[1].FindControl("ddlOrderTypegrd");
                    DropDownList ddlproductTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[2].FindControl("ddlproductTypegrd");
                    DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[3].FindControl("ddlproductgrd");
                    DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[4].FindControl("ddlQuantitygrd");
                    TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtTotalgrd");
                    TextBox txtOrder1 = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[6].FindControl("txtOrder");
                   
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Col1"] = ddlOrderTypegrd.SelectedValue;
                    dtCurrentTable.Rows[i - 1]["Col2"] = ddlproductTypegrd.SelectedValue;
                    dtCurrentTable.Rows[i - 1]["Col3"] = ddlproductgrd.SelectedValue;
                    dtCurrentTable.Rows[i - 1]["Col4"] = ddlQuantitygrd.SelectedValue;
                    dtCurrentTable.Rows[i - 1]["Col5"] = txtTotalgrd.Text;
                    dtCurrentTable.Rows[i - 1]["Col6"] = txtOrder1.Text;
                    rowIndex++;
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTable"] = dtCurrentTable;

                grvStudentDetails.DataSource = dtCurrentTable;
                grvStudentDetails.DataBind();

                DropDownList txn = (DropDownList)grvStudentDetails.Rows[1].Cells[1].FindControl("ddlOrderTypegrd");
                txn.Focus();
               
                // txn.Focus;
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }
        SetPreviousData();
    }
    private void SetPreviousData()
    {
        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlOrderTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[1].FindControl("ddlOrderTypegrd");
                    DropDownList ddlproductTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[2].FindControl("ddlproductTypegrd");
                    DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[3].FindControl("ddlproductgrd");
                    DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[4].FindControl("ddlQuantitygrd");
                    TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtTotalgrd");
                    TextBox txtOrder1 = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[6].FindControl("txtOrder");
                 
                    ddlOrderTypegrd.SelectedValue = dt.Rows[i]["Col1"].ToString();
                    ddlproductTypegrd.SelectedValue = dt.Rows[i]["Col2"].ToString();
                    ddlproductgrd.SelectedValue = dt.Rows[i]["Col3"].ToString();
                    ddlQuantitygrd.Text = dt.Rows[i]["Col4"].ToString();
                    txtTotalgrd.Text = dt.Rows[i]["Col5"].ToString();
                    txtOrder1.Text = dt.Rows[i]["Col6"].ToString();
                    if (txtOrder1.Text == "")
                        txtOrder1.Text = "0";
                   
                    rowIndex++;
                }
            }
        }
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddNewRow();

      
                                                                                                                
    }
   
    protected void grvStudentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SetRowData();
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["CurrentTable"] = dt;
                grvStudentDetails.DataSource = dt;
                grvStudentDetails.DataBind();

                for (int i = 0; i < grvStudentDetails.Rows.Count - 1; i++)
                {
                    grvStudentDetails.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                }
                SetPreviousData();
            }
        }
    }

    private void SetRowData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    DropDownList ddlOrderTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[1].FindControl("ddlOrderTypegrd");
                    DropDownList ddlproductTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[2].FindControl("ddlproductTypegrd");
                    DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[3].FindControl("ddlproductgrd");
                    DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[4].FindControl("ddlQuantitygrd");
                    TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtTotalgrd");
                    TextBox txtOrder1 = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtOrder");
                 
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Col1"] = ddlOrderTypegrd.SelectedValue;
                    dtCurrentTable.Rows[i - 1]["Col2"] = ddlproductTypegrd.SelectedValue;
                    dtCurrentTable.Rows[i - 1]["Col3"] = ddlproductgrd.SelectedValue;
                    dtCurrentTable.Rows[i - 1]["Col4"] = ddlQuantitygrd.Text;
                    dtCurrentTable.Rows[i - 1]["Col5"] = txtTotalgrd.Text;
                    dtCurrentTable.Rows[i - 1]["Col6"] = txtOrder1.Text;
                    
                    rowIndex++;
                }

                ViewState["CurrentTable"] = dtCurrentTable;
                //grvStudentDetails.DataSource = dtCurrentTable;
                //grvStudentDetails.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }
        //SetPreviousData();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SetRowData();
            DataTable table = ViewState["CurrentTable"] as DataTable;

            if (table != null)
            {
                foreach (DataRow row in table.Rows)
                {
                    string txName = row.ItemArray[1] as string;
                    string txAge = row.ItemArray[2] as string;
                    string txAdd = row.ItemArray[3] as string;
                    string rbGen = row.ItemArray[4] as string;
                    string drpQual = row.ItemArray[5] as string;


                    if (txName != null ||
                        txAge != null ||
                        txAdd != null ||
                        rbGen != null ||
                        drpQual != null)
                    {
                        // Do whatever is needed with this data, 
                        // Possibily push it in database
                        // I am just printing on the page to demonstrate that it is working.
                        Response.Write(string.Format("{0} {1} {2} {3} {4}<br/>", txName, txAge, txAdd, rbGen, drpQual));
                    }

                }
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    protected void grvStudentDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
         

            MainFunctions SA = new MainFunctions();
            //Find the DropDownList in the Row
            DropDownList ddlproductTypegrd = (e.Row.FindControl("ddlproductTypegrd") as DropDownList);
            ddlproductTypegrd.DataSource = SA.GetList("GetProductType", null, null,null);
            ddlproductTypegrd.DataTextField = "ProductType";
            ddlproductTypegrd.DataValueField = "ProductTypeID";
            ddlproductTypegrd.DataBind();


            //--------------------------------------added in may 2017--------------------
            DataTable Dtp = new DataTable();
            Dtp = (DataTable)ViewState["CurrentTable"];
            MainFunctions SA11 = new MainFunctions();
            DataTable proddt = new DataTable();
            DropDownList ddlproductTypegrd11 = (e.Row.FindControl("ddlproductTypegrd") as DropDownList);
            int? ProductTypeID11 = null;
            try { ProductTypeID11 = Int32.Parse(Dtp.Rows[count]["Col2"].ToString()); }
            catch { ProductTypeID11 = Convert.ToInt32(ddlproductTypegrd11.SelectedValue); }
            proddt = SA11.GetList("GetProduct", ProductTypeID11, null, null);

             DropDownList ddlproductgrd11 = (e.Row.FindControl("ddlproductgrd") as DropDownList);
             ddlproductgrd11.DataSource = proddt;
            ddlproductgrd11.DataTextField = "ProductName";
            ddlproductgrd11.DataValueField = "ProductID";
            ddlproductgrd11.DataBind();

            //--------------------------------------------------

            //Add Default Item in the DropDownList
           // ddlproductTypegrd.Items.Insert(0, new ListItem("select"));
            
            //DataTable Dtp = new DataTable();
            //Dtp = (DataTable)ViewState["CurrentTable"];

            //int? ProductTypeID = null;
            // DataSet ds = new DataSet();
            
            // try {
            //     ProductTypeID =Int32.Parse(Dtp.Rows[count]["Col2"].ToString());
                 
            // }
            //catch { ProductTypeID = null; }
             //int? ProductID=null;
             //try
             //{
             //    ProductID = Int32.Parse(Dtp.Rows[count]["Col3"].ToString());

             //}
             //catch { ProductID = null; }
             //MainFunctions SA1 = new MainFunctions();

             //Dtp = SA1.GetList("GetProduct", ProductTypeID, null, null);
             //DropDownList ddlproductgrd = (e.Row.FindControl("ddlproductgrd") as DropDownList);

             //ddlproductgrd.DataSource = Dtp;
             //ddlproductgrd.DataTextField = "ProductName";
             //ddlproductgrd.DataValueField = "ProductID";
             //ddlproductgrd.DataBind();
            //ddlproductgrd.Items.Insert(0, new ListItem("select"));
            MainFunctions SA2 = new MainFunctions();

            DropDownList ddlproductgrd = (e.Row.FindControl("ddlproductgrd") as DropDownList);
            int? ProductID = null;
            try
            {
                ProductID = Int32.Parse(Dtp.Rows[count]["Col3"].ToString());
                //  ProductID = Int32.Parse(ddlproductgrd.SelectedValue);

            }
            catch { ProductID = Int32.Parse(ddlproductgrd.SelectedValue); }


            Dtp = SA2.GetList("GetRate", null, ProductID, null);
            DropDownList ddlQuantitygrd = (e.Row.FindControl("ddlQuantitygrd") as DropDownList);

            ddlQuantitygrd.DataSource = Dtp;
            ddlQuantitygrd.DataTextField = "Quantity";
            ddlQuantitygrd.DataValueField = "UnitID";
            ddlQuantitygrd.DataBind();
            ddlQuantitygrd.Items.Insert(0, new ListItem("select"));
            TextBox txtTotalgrd1 = (e.Row.FindControl("txtTotalgrd") as TextBox) ;
            txtTotalgrd1.Text = "0";
            
            count = count + 1;
        }


    }

    protected void ddlproductTypegrd_SelectedIndexChanged(object sender, EventArgs e)
    {        
         MainFunctions SA=new MainFunctions();
        DropDownList drp = (DropDownList)sender;
        GridViewRow gv = (GridViewRow)drp.NamingContainer;
        int index = gv.RowIndex;
        DropDownList ddlproductTypegrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlproductTypegrd");
        int? ProductTypeID = null;
        try { ProductTypeID = Convert.ToInt32(ddlproductTypegrd.SelectedValue); }
        catch { ProductTypeID = null; }
        dt = SA.GetList("GetProduct", ProductTypeID, null,null);

        DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlproductgrd");
        ddlproductgrd.DataSource = dt;
        ddlproductgrd.DataTextField = "ProductName";
        ddlproductgrd.DataValueField = "ProductID";
        ddlproductgrd.DataBind();
        ddlproductgrd.Items.Insert(0, new ListItem("select"));

        ScriptManager scriptMan = ScriptManager.GetCurrent(this);

        if (ddlproductgrd != null)
        {
            ddlproductgrd.SelectedIndexChanged += ddlproductgrd_SelectedIndexChanged;
            scriptMan.RegisterAsyncPostBackControl(ddlproductgrd);
        }

        DataTable dt1 = new DataTable();
        dt1.Columns.Add("Quantity");
        dt1.Columns.Add("UnitID");

        DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlQuantitygrd");
        ddlQuantitygrd.DataSource = dt1;
        ddlQuantitygrd.DataTextField = "Quantity";
        ddlQuantitygrd.DataValueField = "UnitID";
        ddlQuantitygrd.DataBind();
        ddlQuantitygrd.Items.Clear();
        ddlQuantitygrd.Items.Insert(0, new ListItem("select"));

        TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[index].FindControl("txtTotalgrd");
        txtTotalgrd.Text = "0";
        TotalCalculation();



    }
    
    protected void ddlproductgrd_SelectedIndexChanged(object sender, EventArgs e)
    {
        MainFunctions SA = new MainFunctions();
        DropDownList drp = (DropDownList)sender;
        GridViewRow gv = (GridViewRow)drp.NamingContainer;
        int index = gv.RowIndex;
        DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlproductgrd");

        int? ProductTypeID = null;
        try { ProductTypeID = Convert.ToInt32(ddlproductgrd.SelectedValue); }
        catch { ProductTypeID = null; }
        dt = SA.GetList("getRate", null, ProductTypeID, null);

        DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlQuantitygrd");
        ddlQuantitygrd.DataSource = dt;
        ddlQuantitygrd.DataTextField = "Quantity";
        ddlQuantitygrd.DataValueField = "UnitID";
        ddlQuantitygrd.DataBind();
        ddlQuantitygrd.Items.Insert(0, new ListItem("select"));

        TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[index].FindControl("txtTotalgrd");
        txtTotalgrd.Text = "0";

        TotalCalculation();
        //lblPerquantity.Text = dt.Rows[0]["Rate"].ToString();
        //lblunit.Text = dt.Rows[0]["UnitType"].ToString();
        //lblPer.Text = "Per";
    }

    protected void ddlQuantitygrd_SelectedIndexChanged(object sender, EventArgs e)
    {

        MainFunctions SA = new MainFunctions();
        DropDownList drp = (DropDownList)sender;
        GridViewRow gv = (GridViewRow)drp.NamingContainer;
        int index = gv.RowIndex;
        DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlproductgrd");

        int? ProductTypeID = null;
        try { ProductTypeID = Convert.ToInt32(ddlproductgrd.SelectedValue); }
        catch { ProductTypeID = null; }
        dt = SA.GetList("CalculatedTotal", null, ProductTypeID, null);

        DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlQuantitygrd");

        int? Quantity = null;
        try { Quantity = Convert.ToInt32(ddlQuantitygrd.SelectedItem.Text); }
        catch { Quantity = null; }

        double Rate =0.0;
        Rate =double.Parse(dt.Rows[0]["Rate"].ToString());
        TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[index].FindControl("txtTotalgrd");
        txtTotalgrd.Text =( Rate * Quantity).ToString();

        DropDownList ddlOrderTypegrd = (DropDownList)grvStudentDetails.Rows[index].FindControl("ddlOrderTypegrd");
        int? OrderTypeid = null;
        try { OrderTypeid = Convert.ToInt32(ddlOrderTypegrd.SelectedValue); }
        catch { OrderTypeid = null; }

        if (OrderTypeid != 1)
            txtTotalgrd.Text = "0";

        TotalCalculation();
         
    }

    protected void TotalCalculation()
    {
        order od = new order();
        int rowIndex = 0;
        List<order> lstodr = new List<order>();
        lblTotal.Text = "0";
        foreach (GridViewRow row in grvStudentDetails.Rows)
        {
            od = new order();
            TextBox txtTotalgrd1 = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtTotalgrd");


            try
            {
                od.Total = double.Parse(txtTotalgrd1.Text);
                lblTotal.Text = (double.Parse(lblTotal.Text) + double.Parse(txtTotalgrd1.Text)).ToString();

            }
            catch 
            {

            }

            rowIndex++;
        }
    }

    protected void btnSaveorder_Click(object sender, EventArgs e)
    {
        order od =new order();
        int rowIndex = 0;
        List<order> lstodr = new List<order>();

        //  if (ViewState["CurrentTable"] != null)
        //{
        //    DataTable dt = (DataTable)ViewState["CurrentTable"];
        //    if (dt.Rows.Count > 0)
        //    {
        //        for (int i = 1; i < dt.Rows.Count; i++)
        //        {
        //            DropDownList ddlOrderTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[1].FindControl("ddlOrderTypegrd");
        //            DropDownList ddlproductTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[2].FindControl("ddlproductTypegrd");
        //            DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[3].FindControl("ddlproductgrd");
        //            DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[4].FindControl("ddlQuantitygrd");
        //            TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtTotalgrd");
                 
        //            od.OrderTypeID = int.Parse(dt.Rows[i]["Col1"].ToString());
        //            od.productTypeID = int.Parse(dt.Rows[i]["Col2"].ToString());
        //            od.productID = int.Parse(dt.Rows[i]["Col3"].ToString());
        //            od.QuantityID = int.Parse(dt.Rows[i]["Col4"].ToString());
        //            od.Total = double.Parse(dt.Rows[i]["Col5"].ToString());
        //            lstodr.Add(od);
        //            rowIndex++;
        //        }
        //       MainFunctions MF=new MainFunctions();
        //      dt= MF.Save(lstodr, "Save");
        //    }

        //}

          foreach (GridViewRow row in grvStudentDetails.Rows)
          {
              od = new order();
              DropDownList ddlOrderTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[1].FindControl("ddlOrderTypegrd");
              DropDownList ddlproductTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[2].FindControl("ddlproductTypegrd");
              DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[3].FindControl("ddlproductgrd");
              DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[4].FindControl("ddlQuantitygrd");
              TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtTotalgrd");
              TextBox txtOrder1 = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[6].FindControl("txtOrder");


              od.OrderTypeID = int.Parse(ddlOrderTypegrd.SelectedValue);
              od.productTypeID = int.Parse(ddlproductTypegrd.SelectedValue);
              od.productID = int.Parse(ddlproductgrd.SelectedValue);
              od.QuantityID = int.Parse(ddlQuantitygrd.SelectedValue);
              od.Total = double.Parse(txtTotalgrd.Text);
              od.CustID =Int32.Parse(txtfname.Text);
              od.OrderID = Int32.Parse(txtOrder1.Text);
              od.AddedBY = Session["UserName"].ToString();
              
              try
              {
                  od.DeliveryDate = DateTime.Parse(txtDeliveryDate.Text);
              }
              catch 
              {
                  od.DeliveryDate = null;
                  
              }
              
            
              lstodr.Add(od);
              rowIndex++;
          }
          MainFunctions MF1 = new MainFunctions();
          dt = MF1.Save(lstodr, "Save");
          ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
          "alertScript", "alert('Saved Successfully.....');", true);
          FirstGridViewRow();
          //lblTotal.Text = "0";
          //DataTable DT1 = new DataTable();
          //MainFunctions MFGETNO = new MainFunctions();
          //DT1 = MFGETNO.GetfranchmobileNo(Session["UserName"].ToString());
          //string Message = "Order Received for "+ txtLastname.Text + " Bill amount for the order placed is Rs " + lblTotal.Text + " Customer will be intimated once order is processed.";
          //MFGETNO.send(Message, txtMobileNO.Text + "," + DT1.Rows[0]["MobileNo"].ToString());


          DataTable DT1 = new DataTable();
          DT1 = MF1.GetfranchmobileNo(Session["UserName"].ToString());
          string Message = "Order Received for " + txtlname.Text + ".Bill amount for the order placed is Rs. " + lblTotal.Text + ". Customer will be intimated once order is processed.";
          //MF1.sendwithCustcare(Message, DT1.Rows[0]["MobileNo"].ToString());
          lblTotal.Text = "0";
        
        }



    protected void btnEdit_Click(object sender, EventArgs e)
    {
        DateTime Startdate=DateTime.Parse("1900-01-01 00:00:00.000");;
        DateTime Endtime = DateTime.Parse("1900-01-01 00:00:00.000"); ;
        grdorderhide.Visible = true;
        MainFunctions MF1 = new MainFunctions();
        order ord = new order();
        ord.CustID = Int32.Parse(txtfname.Text);
        dt = MF1.Edit(ord, "Edit",Startdate,Endtime,"");

        //for (int i = 1; i <= dt.Rows.Count - 1;i++ )
        //{
        //    AddNewRow();
        //}
        grvStudentDetails.DataSource = dt;
        grvStudentDetails.DataBind();

        int rowIndex = 0;
        int total = 0;
        ViewState["CurrentTable"] = dt;
        if (ViewState["CurrentTable"] != null)
        {
           // DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList ddlOrderTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[1].FindControl("ddlOrderTypegrd");
                    DropDownList ddlproductTypegrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[2].FindControl("ddlproductTypegrd");
                    DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[3].FindControl("ddlproductgrd");
                    DropDownList ddlQuantitygrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[4].FindControl("ddlQuantitygrd");
                    TextBox txtTotalgrd = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[5].FindControl("txtTotalgrd");
                    TextBox txtOrder1 = (TextBox)grvStudentDetails.Rows[rowIndex].Cells[6].FindControl("txtOrder");

                    //-------------------------------------------------------------------------------------------//
                    DataTable Dtp = new DataTable();
                    Dtp = (DataTable)ViewState["CurrentTable"];

                    int? ProductTypeID = null;
                    DataSet ds = new DataSet();

                    try
                    {
                        ProductTypeID = Int32.Parse(Dtp.Rows[i]["Col2"].ToString());

                    }
                    catch { ProductTypeID = null; }
                    int? ProductID = null;
                    try
                    {
                        ProductID = Int32.Parse(Dtp.Rows[i]["Col3"].ToString());

                    }
                    catch { ProductID = null; }
                    MainFunctions SA1 = new MainFunctions();

                    Dtp = SA1.GetList("GetProduct", ProductTypeID, null, null);
                   // DropDownList ddlproductgrd = (DropDownList)grvStudentDetails.Rows[rowIndex].Cells[3].FindControl("ddlproductgrd");
                   // DropDownList ddlproductgrd = (e.Row.FindControl("ddlproductgrd") as DropDownList);

                    ddlproductgrd.DataSource = Dtp;
                    ddlproductgrd.DataTextField = "ProductName";
                    ddlproductgrd.DataValueField = "ProductID";
                    ddlproductgrd.DataBind();
                    ddlproductgrd.Items.Insert(0, new ListItem("select"));
                    MainFunctions SA2 = new MainFunctions();

                    Dtp = SA2.GetList("GetRate", null, ProductID, null);
                   // DropDownList ddlQuantitygrd = (e.Row.FindControl("ddlQuantitygrd") as DropDownList);

                    ddlQuantitygrd.DataSource = Dtp;
                    ddlQuantitygrd.DataTextField = "Quantity";
                    ddlQuantitygrd.DataValueField = "UnitID";
                    ddlQuantitygrd.DataBind();
                    ddlQuantitygrd.Items.Insert(0, new ListItem("select"));
           
                    //-------------------------------------------------------------------------------------------//

                    ddlOrderTypegrd.SelectedValue = dt.Rows[i]["Col1"].ToString();
                    ddlproductTypegrd.SelectedValue = dt.Rows[i]["Col2"].ToString();
                    ddlproductgrd.SelectedValue = dt.Rows[i]["Col3"].ToString();
                    ddlQuantitygrd.Text = dt.Rows[i]["Col4"].ToString();
                    txtTotalgrd.Text = dt.Rows[i]["Col5"].ToString();
                    txtOrder1.Text = dt.Rows[i]["Col6"].ToString();
                    try
                    {

                    total = total + Int32.Parse(txtTotalgrd.Text);

                    }
                    catch
                    {

                    }
                        rowIndex++;
                }
            }
        }


         
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        trsearchlabel.Visible = true;
        trsearchlabel4.Visible = true;
        trsearchlabel2.Visible = true;
        trsearchlabel3.Visible = true;
        grdorderhide.Visible = false;
    }
}
 