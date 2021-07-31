using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                this.AddKeepAlive();
                if (Session["UserName"].ToString() == null)
                {

                    Response.Redirect("Login.aspx");
                }
                else
                {

                    hdnRecogniseID.Value = Session["UserTypeID"].ToString();
                    hdnLoginID.Value = Session["ID"].ToString();///login id i.e franch  or admin
                    hdnLoginName.Value = Session["UserName"].ToString(); //franch name or admin name
                    Session["UserTypeID"] = hdnRecogniseID.Value;
                    Session["ID"] = hdnLoginID.Value;
                    Session["UserName"] = hdnLoginName.Value;
                }
            }
            catch 
            {
                Response.Redirect("sessiontimeout.aspx");
            }
            


        }
    }
    private void AddKeepAlive()
        {
        int int_MilliSecondsTimeOut = (this.Session.Timeout * 60000) - 30000;
        string str_Script = @"
        <script type='text/javascript'>
        //Number of Reconnects
        var count=0;
        //Maximum reconnects setting
        var max = 5;
        function Reconnect(){

        count++;
        if (count < max)
        {
        window.status = 'Link to Server Refreshed ' + count.toString()+' time(s)' ;

        var img = new Image(1,1);

        img.src = 'Reconnect.aspx';

        }
        }

        window.setInterval('Reconnect()',"+ int_MilliSecondsTimeOut.ToString()+ @"); //Set to length required

        </script>

        ";

        this.Page.RegisterClientScriptBlock("Reconnect", str_Script);

        }
}
