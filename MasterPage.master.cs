using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        KGManager.log("Starting");
        if (KGManager.userLogin.Equals(""))
        {
            Response.Redirect("/aspx/Login.aspx");
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
