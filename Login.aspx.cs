using CMS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet Ds = new DataSet();
             Customer Comp = new Customer();
             MainFunctions Function = new  MainFunctions();

            Comp._Password = ( Encrypt.Encryptor(txtPassword.Text));
            Comp._UserID = txtUserName.Text;
            Ds = Function.GetValues("Login", Comp);
            if (Ds.Tables[0].Rows.Count > 0)
            {
                if (int.Parse(Ds.Tables[0].Rows[0]["UserTypeID"].ToString()) == 1 )
                {
                    Session["UserTypeID"] = Ds.Tables[0].Rows[0]["UserTypeID"].ToString();
                    Session["UserName"] = Ds.Tables[0].Rows[0]["UserName"].ToString();
                    Session["ID"] = Ds.Tables[0].Rows[0]["ID"].ToString();
                    //Response.Redirect("AddPerson.aspx?Xi7d=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["RecogniseID"].ToString())) + "&Xi7d2=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["UserName"].ToString())) + "&ZYI7d7=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["Name"].ToString())));
                    Response.Redirect("admin\\AddPerson.aspx");


                }
                if ( int.Parse(Ds.Tables[0].Rows[0]["UserTypeID"].ToString()) == 2)
                {
                    Session["UserTypeID"] = Ds.Tables[0].Rows[0]["UserTypeID"].ToString();
                    Session["UserName"] = Ds.Tables[0].Rows[0]["UserName"].ToString();
                    Session["ID"] = Ds.Tables[0].Rows[0]["ID"].ToString();
                    //Response.Redirect("AddPerson.aspx?Xi7d=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["RecogniseID"].ToString())) + "&Xi7d2=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["UserName"].ToString())) + "&ZYI7d7=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["Name"].ToString())));
                    Response.Redirect("AddPerson.aspx");


                }
                else
                {
                    if (int.Parse(Ds.Tables[0].Rows[0]["UserTypeID"].ToString()) == 3)
                    {
                      //pass franchID
                        Response.Redirect("Order.aspx?Xi7d=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["RecogniseID"].ToString())) + "&Xi7d2=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["UserName"].ToString())) + "&ZYI7d7=" + (Encrypt.Encryptor(Ds.Tables[0].Rows[0]["Name"].ToString())));
                    }
                }
           }
            else
            {
                MessageBox.Show("Username or password is wrong.");
            }

        }
        catch
        {

        }

         
    }
}