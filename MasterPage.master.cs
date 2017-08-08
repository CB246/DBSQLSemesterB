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
        if (KGManager.userLogin.Equals(""))
        {
            Response.Redirect("/aspx/Login.aspx");
            Context.ApplicationInstance.CompleteRequest();
        }
        else
        {
            lblName.Text = KGManager.userName;
            switch(KGManager.userName.Split(' ')[0])
            {
                case "Mr":
                    imgAvatar.ImageUrl = "/images/Mr.png";
                    break;
                case "Ms":
                    imgAvatar.ImageUrl = "/images/Ms.png";
                    break;
                default:
                    imgAvatar.ImageUrl = "/images/admin.png";
                    break;
            }
            if (KGManager.userLogin.Equals("Admin"))
            {
                kids.Attributes.Remove("class");
                kids.Attributes.Add("class", "hidden");
                signedFor.Attributes.Remove("class");
                signedFor.Attributes.Add("class", "hidden");

                import.Attributes.Remove("class");
                activities.Attributes.Remove("class");
                queries.Attributes.Remove("class");
            }
            else
            {
                kids.Attributes.Remove("class");
                signedFor.Attributes.Remove("class");

                import.Attributes.Remove("class");
                import.Attributes.Add("class", "hidden");
                activities.Attributes.Remove("class");
                activities.Attributes.Add("class", "hidden");
                queries.Attributes.Remove("class");
                queries.Attributes.Add("class", "hidden");
            }
        }
    }
}
