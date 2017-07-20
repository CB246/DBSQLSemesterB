using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        KGManager.logOut();
        KGManager.userLogin = "";
        KGManager.userPassword = "";
        Response.Redirect("Login.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
}