using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class ProductType : System.Web.UI.Page
{
    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillGride();
            GetProductData();

        }

    }
    protected void FillGride()
    {
        DataTable dt = new DataTable();
        string myQuery = ("select * from Master_Rate MR JOIN  Master_Product MP ON MP.ProductID=MR.ProductID JOIN MASTER_ProductType MSP ON MP.ProductTypeID=MSP.ProductTypeID");
        SqlCommand myCommand = new SqlCommand(myQuery, myconn);
        SqlDataAdapter ad = new SqlDataAdapter(myCommand);
        ad.Fill(dt);
        Gridproduct.DataSource = dt;
            Gridproduct.DataBind();
    
    }
    private void GetProductData()
    {
      
        myconn.Open();

        {
            DataTable dt = new DataTable();
            ddlproducttype.Items.Clear();
            ddlproducttype.Items.Add("");


            string myQuery = ("select distinct ProducttYPEID, producttYPE from Master_ProducttYPE");
            SqlCommand myCommand = new SqlCommand(myQuery, myconn);
            SqlDataAdapter AD = new SqlDataAdapter(myCommand);
            AD.Fill(dt);
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {

                ddlproducttype.Items.Add(new ListItem(dt.Rows[i]["producttYPE"].ToString(), dt.Rows[i]["ProducttYPEID"].ToString()));
                
            }
        }
    }
     
    protected void Gridproduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void Gridproduct_RowCommand(object sender, GridViewCommandEventArgs e)
    {
         Int32 ID = 0;
        if (e.CommandName.Equals("selectLead"))
        {
            ID = Int32.Parse(e.CommandArgument.ToString());
            lblID.Enabled = true;
        }
        lblID.Text = ID.ToString();

        DataTable dt = new DataTable();
         string myQuery = ("select distinct MP.ProductTypeID,MR.ProductID,Rate,Quantity,UnitType from Master_Rate MR JOIN Master_Product MP ON MP.ProductID=MR.ProductID join Master_ProductTYPE MPT ON MP.ProductTYPEID=Mp.ProductTYPEID where RateID="+lblID.Text);
         SqlCommand myCommand = new SqlCommand(myQuery, myconn);
        SqlDataAdapter AD = new SqlDataAdapter(myCommand);
        AD.Fill(dt);
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            Textrate.Text = dt.Rows[i]["rate"].ToString();
           TextQuantity.Text = dt.Rows[i]["Quantity"].ToString();
            Texttype.Text = dt.Rows[i]["Unittype"].ToString();

            ddlproducttype.SelectedValue=(dt.Rows[i]["producttypeID"].ToString()).ToString();
            FillProduct();
            ddlproduct.SelectedValue = (dt.Rows[i]["productID"].ToString()).ToString();

        }


    }
    protected void Gridproduct_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
   {

   }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //string myQuery = "insert into Master_Rate(ProductID,Rate,Type,Quantity)values('" + this.ddlproduct.SelectedValue + "','" + this.Textrate.Text + "','" + this.Texttype.Text + "','" + this.TextQuantity.Text + "')";
        //SqlCommand myCommand = new SqlCommand(myQuery, myconn);
        //myconn.Open();
        ////myCommand.ExecuteNonQuery();
        //myconn.Close();
        //FillGride();
    }
    protected void ddlproducttype_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillProduct();
    }


    protected void FillProduct()
    {
        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ToString());
        myConn.Open();

        {
            DataTable dt = new DataTable();

            ddlproduct.Items.Clear();
            ddlproduct.Items.Add("");

            string myQuery = ("select distinct productName,ProductID from Master_Product where ProductTypeID='" + ddlproducttype.SelectedValue + "'");
            SqlCommand myCommand = new SqlCommand(myQuery, myConn);
            SqlDataAdapter AD = new SqlDataAdapter(myCommand);
            AD.Fill(dt);
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {

                ddlproduct.Items.Add(new ListItem(dt.Rows[i]["productName"].ToString(), dt.Rows[i]["ProductID"].ToString()));

            }
        }
    }
    
   
    protected void Btnupdate_Click(object sender, EventArgs e)
    {
        string myQuery = "update Master_Rate set Rate='" + Textrate.Text + "',UnitType='" + Texttype.Text + "'  where RateID="+lblID.Text;
        SqlCommand myCommand = new SqlCommand(myQuery, myconn);
        myconn.Open();
        myCommand.ExecuteNonQuery();
        myconn.Close();
        FillGride();
    }
}
