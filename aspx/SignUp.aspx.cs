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
        
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        KGManager.log("Sugn Up button was clicked");
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("parentID", tbLogin.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("checkIfIDExists", data);
        KGManager.log("signUp after check -> " + dt.Rows.Count);
        if (dt.Rows.Count != 0)
        {
            litLogin.Text = "This ID is already exists";
        }
        else
        {
            litLogin.Text = "";
            data.Add("firstName", tbFirstName.Text);
            data.Add("surName", tbLastName.Text);
            data.Add("DOB", tbDOB.Text);
            data.Add("gender", rblGender.SelectedIndex == 0 ? 'M' : 'F');
            data.Add("pass", tbPassword.Text);
            dt = DBConnection.runProcWithResults("addParent", data);
            if (dt.Rows.Count == 1)
            {
                KGManager.log("Parent was added successfully");
                KGManager.userLogin = tbLogin.Text;
                Response.Redirect("/Default.aspx");
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                KGManager.log("Parent was't added");
                litLogin.Text = "Something went wrong ;(";
            }
        }
    }
}