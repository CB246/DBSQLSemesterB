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
           if (tbLogin.Text.Equals(""))
        {
            KGManager.log("ID is empty!");
        }
        if (!tbLogin.Text.All(char.IsDigit))
        {
            KGManager.log("ID isn'n number");
        }
           if (tbLogin.Text.Length != 9)
        {
            KGManager.log("ID isn't 9 digits");
        }
           if (tbFirstName.Text.Equals(""))
        {
            KGManager.log("First Name is empty");
        }
           if (tbLastName.Text.Equals(""))
        {
            KGManager.log("Last Name is empty");
        }
           if (rblGender.SelectedIndex == -1)
        {
            KGManager.log("Gender wasn't chose");
        }
           if (tbDOB.Text.Equals(""))
        {
            KGManager.log("DOB is empty");
        }
           if (tbPassword.Text.Equals(""))
        {
            KGManager.log("Password is empty");
        }
           if (tbPasswordConfirm.Text.Equals(""))
        {
            KGManager.log("Password confirmation is empty");
        }
           if (!tbPassword.Text.Equals(tbPasswordConfirm.Text))
        {
            KGManager.log("Password confirmation failed");
        }
    }
}