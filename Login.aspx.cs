using System;
using System.Collections.Generic;
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
        System.Diagnostics.Debug.WriteLine("Login -> " + tbLogin.Text + " Pass -> " + tbPassword.Text);
        if (tbLogin.Text.Equals("Admin") && tbPassword.Text.Equals("Admin"))
        {
            System.Diagnostics.Debug.WriteLine("Trying to redirect to default page");
            Response.Redirect("SignUp.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
            System.Diagnostics.Debug.WriteLine("Redirected");
        }
    }
}