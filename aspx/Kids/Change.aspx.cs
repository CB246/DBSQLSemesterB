using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Kids_Change : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cancelButton_Click(object sender, EventArgs e)
    {
        closeMessage();
    }

    private void closeMessage()
    {
        lblMessage.Text = "";
        defaultModal.Attributes.CssStyle.Value = "display: none;";
        defaultModal.Attributes.Remove("class");
        defaultModal.Attributes.Add("class", "modal fade");
        modalColor.Attributes.Remove("class");
        modalColor.Attributes.Add("class", "modal-content");
    }
}