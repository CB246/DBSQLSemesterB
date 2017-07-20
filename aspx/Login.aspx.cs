using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (tbLogin.Text.Equals("Admin") && tbPassword.Text.Equals("Admin"))
        {
            KGManager.userLogin = "Admin";
            KGManager.userPassword = "Admin";
            Response.Redirect("/Default.aspx");
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}