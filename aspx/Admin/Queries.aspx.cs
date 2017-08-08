using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_Queries : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void showMessage(System.Data.DataTable dt)
    {
        defaultModal.Attributes.CssStyle.Value = "display: block; margin-top: 15%;";
        defaultModal.Attributes.Remove("class");
        defaultModal.Attributes.Add("class", "modal fade in");
        modalColor.Attributes.Remove("class");
        modalColor.Attributes.Add("class", "modal-content modal-col-green");
        modalColor.Attributes.CssStyle.Value = "width: 800px; margin: auto;";
        gvTable.DataSource = dt;
        gvTable.DataBind();
    }

    protected void cancelButton_Click(object sender, EventArgs e)
    {
        closeMessage();
    }

    private void closeMessage()
    {
        defaultModal.Attributes.CssStyle.Value = "display: none;";
        defaultModal.Attributes.Remove("class");
        defaultModal.Attributes.Add("class", "modal fade");
        modalColor.Attributes.Remove("class");
        modalColor.Attributes.Add("class", "modal-content");
        lbQuery.SelectedIndex = 0;
    }

    protected void btnRunQuery_Click(object sender, EventArgs e)
    {
        System.Data.DataTable dt = DBConnection.runProcWithResults("query" + lbQuery.SelectedValue.Split(' ')[1], new Dictionary<string, object>());
        showMessage(dt);
    }
}