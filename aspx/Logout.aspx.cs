using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        KGManager.logOut();
        Response.Redirect("/aspx/Login.aspx");
        Context.ApplicationInstance.CompleteRequest();
    }
}