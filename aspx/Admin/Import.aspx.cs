using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_Import : System.Web.UI.Page
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

    protected void btnImport_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile.ContentLength == 0)
        {
            KGManager.log("EMPTY FILE");
            showMessage("Choose a file first.", "red", 200);
        }
        else
        {
            using (System.IO.StreamReader inputStreamReader = new System.IO.StreamReader(FileUpload1.PostedFile.InputStream))
            {
                //ADD ALL ROWS TO DB    -   insertUpdateT
                while (!inputStreamReader.EndOfStream)
                {
                    string[] row = inputStreamReader.ReadLine().Split(',');
                    Dictionary<string, object> data = new Dictionary<string, object>();
                    data.Add("1", row[1]);
                    data.Add("2", row[2]);
                    if (row[0].Equals("TFA"))
                    {
                        data.Add("3", row[3]);
                    }
                    DBConnection.runProcWithResults("insertUpdate" + row[0], data);
                }
            }
        }
    }

    private void showMessage(string text, string color, int width)
    {
        lblMessage.Text = text;
        defaultModal.Attributes.CssStyle.Value = "display: block; margin-top: 15%;";
        defaultModal.Attributes.Remove("class");
        defaultModal.Attributes.Add("class", "modal fade in");
        modalColor.Attributes.Remove("class");
        modalColor.Attributes.Add("class", "modal-content modal-col-" + color);
        modalColor.Attributes.CssStyle.Value = "width: " + width + "px; margin: auto;";
    }
}