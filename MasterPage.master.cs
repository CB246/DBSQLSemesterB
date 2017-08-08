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
                //addKid.Attributes.Remove("class");
                //addKid.Attributes.Add("class", "hidden");
            }
        }
    }
}
