using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{

    public static String userLogin = "1";
    public static String userPassword = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (userLogin.Equals("") && userPassword.Equals(""))
        {
            Server.Transfer("Login.aspx", true);
        }
        else
        {
            //Server.Transfer("Default.aspx", true);
        }
    }
}
