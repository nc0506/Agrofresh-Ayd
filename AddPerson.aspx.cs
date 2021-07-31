using System;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPerson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
               
                LoginID.Text = Session["ID"].ToString();
                LoginName.Text = Session["UserName"].ToString();
                RecogniseID.Text = Session["UserTypeID"].ToString();

                hdnLoginID.Value = Session["ID"].ToString();///login id i.e franch  or admin
                hdnLoginName.Value = Session["UserName"].ToString(); //franch name or admin name

                FillCity();

                                
            }
            catch
            {
                Response.Redirect("sessiontimeout.aspx");
            }
        }
    }

    private void FillCity()
    {
        DataSet Ds = new DataSet();
        DataTable dt = new DataTable();
        MainFunctions MF1 = new MainFunctions();
        order od = new order();    
        dt = MF1.GetAllList("CityList");
        ddlcity.DataSource = dt;
        ddlcity.DataTextField="City";
        ddlcity.DataValueField = "ID";
        ddlcity.DataBind();
        ddlCityShip.DataSource = dt;

        ddlCityShip.DataTextField = "City";
        ddlCityShip.DataValueField = "ID";
        ddlCityShip.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        MainFunctions SA = new  MainFunctions();
        DataTable dt = new DataTable();
        Customer Cust = new Customer();
        Cust.FirstName = txtFname.Text;
        Cust.MiddleName = txtMiddleName.Text;
        Cust.LastName = txtLastname.Text;
        Cust.MobileNo = txtMobileNO.Text;
        Cust.AltContactNo = txtAlternate.Text;
        Cust.EmailID= txtEmailID.Text;
        try
        {

        Cust.DOB=DateTime.Parse(txtDOB.Text);

        }
        catch
        {

        }
        try
        {
        Cust.AnniversaryDate = DateTime.Parse(txtannivdate.Text);
        
        }
        catch 
        {
             
        }
        Cust.Cur_FlatNo= txtFlatno.Text;
        Cust.Cur_FloorNo= txtFloorNo.Text;
        Cust.Cur_BuildingName= txtBuildingName.Text;
        Cust.Cur_Area= txtArea.Text;
        Cust.Cur_StreetName= txtStreetroad.Text;
        Cust.Cur_Landmark1= txtLandmark1.Text;
        Cust.Cur_Landmark2= txtlandmark2.Text;
        Cust.Cur_State = ddlState.SelectedItem.ToString();
        Cust.Cur_City = ddlcity.SelectedItem.ToString(); ;
        Cust.Cur_Pincode=Int32.Parse(txtPincode.Text);
        Cust.Ship_FlatNo= txtFlatnoShip.Text;
        Cust.Ship_FloorNo = txtFloorNoShip.Text;
        Cust.Ship_BuildingName = txtBuildingNameShip.Text;
        Cust.Ship_Area = txtAreaShip.Text;
        Cust.Ship_StreetName = txtStreetroadShip.Text;
        Cust.Ship_Landmark1 = txtLandmark1ship.Text;
        Cust.Ship_Landmark2 = txtLandmark2ship.Text;
        Cust.Ship_State = ddlState.SelectedItem.ToString();
        Cust.Ship_City = ddlCityShip.SelectedItem.ToString();
        Cust.Ship_Pincode = Int32.Parse(txtPincodeShip.Text);
        Cust.FranchID =Int32.Parse( hdnLoginID.Value.ToString());
        Cust.AddedBy = hdnLoginName.Value;
        dt = SA.Save(Cust, "Save");
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page),
                 "alertScript", "alert('" + dt.Rows[0]["error"].ToString() + "');", true);        

        
        if (dt.Rows[0]["error"].ToString() == "Saved Successfully")
        {
            Allclear();
            string Message = "Dear " + txtFname.Text + "" + txtLastname.Text + " Welcome to Agro Fresh - your own world of Chemical Free Naturally / Organically grown Vegetables and Fruits. Your Order will be processed as committed. For more details you can call our customer care on 9029290022 or visit www.agrofresh-ayd.com.";
            SA.sendwithCustcare(Message, txtMobileNO.Text);
        }
    }
    protected void chkCheckAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkCheckAll.Checked == true)
        {
            txtFlatnoShip.Text = txtFlatno.Text;
            txtFloorNoShip.Text = txtFloorNo.Text;
            txtBuildingNameShip.Text = txtBuildingName.Text;
            txtAreaShip.Text = txtArea.Text;
            txtStreetroadShip.Text = txtStreetroad.Text;
            txtLandmark1ship.Text = txtLandmark1.Text;
            txtLandmark2ship.Text = txtlandmark2.Text;
            //txtStateship.Text=txtState.Text;
            ddlCityShip.SelectedIndex = ddlcity.SelectedIndex  ;
            txtPincodeShip.Text = txtPincode.Text;
        }
        else
        {
            txtFlatnoShip.Text = "";
            txtFloorNoShip.Text = "";
            txtBuildingNameShip.Text = "";
            txtAreaShip.Text ="";
            txtStreetroadShip.Text = "";
            txtLandmark1ship.Text ="";
            txtLandmark2ship.Text = "";
            //txtStateship.Text=txtState.Text;
            ddlCityShip.SelectedIndex=-1;
            txtPincodeShip.Text = "";
        }

    }

    protected void Allclear()
    {
        txtFlatnoShip.Text = "";
        txtFloorNoShip.Text = "";
        txtBuildingNameShip.Text = "";
        txtAreaShip.Text = "";
        txtStreetroadShip.Text = "";
        txtLandmark1ship.Text = "";
        txtLandmark2ship.Text = "";
         
        ddlCityShip.SelectedIndex= -1;
        txtPincodeShip.Text = "";

        txtFlatno.Text = "";
        txtFloorNo.Text = "";
        txtBuildingName.Text = "";
        txtArea.Text = "";
        txtStreetroad.Text = "";
        txtLandmark1.Text = "";
        txtlandmark2.Text = "";

        ddlcity.SelectedIndex = -1;
        txtPincode.Text = "";

        txtFname.Text = "";
        txtMiddleName.Text = "";
        txtLastname.Text = "";
        txtMobileNO.Text = "";
        txtAlternate.Text = "";
        txtDOB.Text = "";
        txtannivdate.Text = "";
        txtEmailID.Text = "";
    }
}