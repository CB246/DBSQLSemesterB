using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_Import : System.Web.UI.Page
{
    private static bool afterAction = false;
    private static int addedT = 0;
    private static int updatedT = 0;
    private static int failedT = 0;
    private static int addedTFA = 0;
    private static int updatedTFA = 0;
    private static int failedTFA = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (afterAction)
        {
            afterAction = false;
            addedT = 0;
            updatedT = 0;
            failedT = 0;
            addedTFA = 0;
            updatedTFA = 0;
            failedTFA = 0;
        }
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
            afterAction = true;
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
                    string ans = (DBConnection.runProcWithResults("insertUpdate" + row[0], data)).Rows[0]["ans"].ToString();
                    if (row[0].Equals("TFA"))
                    {
                        switch (ans)
                        {
                            case "0":
                                failedTFA++;
                                break;
                            case "1":
                                updatedTFA++;
                                break;
                            case "2":
                                addedTFA++;
                                break;
                        }
                    }
                    else
                    {
                        switch (ans)
                        {
                            case "0":
                                failedT++;
                                break;
                            case "1":
                                updatedT++;
                                break;
                            case "2":
                                addedT++;
                                break;
                        }
                    }
                }
            }
        }
        showMessage();
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

    private void showMessage()
    {
        if (addedT > 0) lblMessage.Text += addedT + " rows was added to Training Table<br/>";
        if (updatedT > 0) lblMessage.Text += updatedT + " rows was updated in Training Table<br/>";
        if (failedT > 0) lblMessage.Text += failedT + " rows wasn't added to Training Table<br/>";
        if (addedTFA > 0) lblMessage.Text += addedTFA + " rows was added to TrainingForAssistant Table<br/>";
        if (updatedTFA > 0) lblMessage.Text += updatedTFA + " rows was updated in TrainingForAssistant Table<br/>";
        if (failedTFA > 0) lblMessage.Text += failedTFA + " rows wasn't added to TrainingForAssistant Table<br/>";
        defaultModal.Attributes.CssStyle.Value = "display: block; margin-top: 15%;";
        defaultModal.Attributes.Remove("class");
        defaultModal.Attributes.Add("class", "modal fade in");
        modalColor.Attributes.Remove("class");
        modalColor.Attributes.Add("class", "modal-content modal-col-blue");
        modalColor.Attributes.CssStyle.Value = "width: 400px; margin: auto;";
    }
}