using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_SignUp : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        KGManager.log("Page_Load happened");
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        KGManager.log("Sugn Up button was clicked");
        Dictionary<String, Object> data = new Dictionary<string, object>();
        data.Add("parentID", tbLogin.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("checkIfIDExists", data);
        KGManager.log("signUp after check -> " + dt.Rows.Count);
    }
}