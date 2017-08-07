using System;
using System.Collections.Generic;

public partial class aspx_SignedFor_Add : System.Web.UI.Page
{
    private static System.Data.DataTable act = new System.Data.DataTable();
    private static int currRow = 0;

    private static bool isSuccess = false;
    private static bool alreadyIn = false;
    private static bool afterAction = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (afterAction)
            {
                submitData();
                afterAction = false;
                isSuccess = false;
                alreadyIn = false;
                currRow = 0;
            }
        }
        else
        {
            if (!KGManager.userLogin.Equals("Admin"))
            {
                PopulateList();
            }
            clearAllCard();
        }
    }

    private void PopulateList()
    {
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("parentID", KGManager.userLogin);

        System.Data.DataTable dt = DBConnection.runProcWithResults("getAllKidsOfParent", data);

        foreach (System.Data.DataRow item in dt.Rows)
        {
            System.Web.UI.WebControls.ListItem li = new System.Web.UI.WebControls.ListItem(item["kidID"].ToString());
            rblKids.Items.Add(li);
        }

    }

    protected void rblKids_SelectedIndexChanged(object sender, EventArgs e)
    {
        //get all activities in selected kid class
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("kidID", rblKids.SelectedValue);
        clearAllFields();
        act = DBConnection.runProcWithResults("getAllActivitiesInKidsClass", data);
        if (act.Rows.Count == 0)
        {
            showMessage("There is no activities in Kid's class", "red", 300);
        }
        else
        {
            fillActivityInfo(0);
            activity.Attributes.Remove("class");
            activity.Attributes.Add("class", "container-fluid col-lg-12");
            charts.Attributes.Remove("class");
            charts.Attributes.Add("class", "container-fluid col-lg-8");
            opinions.Attributes.Remove("class");
            opinions.Attributes.Add("class", "container-fluid col-lg-4");
        }
    }

    protected void submitData()
    {
        if (alreadyIn && !isSuccess)
        {
            //ID already in DB - can't add new kid
            showMessage("This ID is already in activity.", "red", 250);
        }

        if (isSuccess)
        {
            //Kid was added successfully to DB
            showMessage("Kid " + rblKids.SelectedValue + " was added successfully to activity.", "green", 400);
        }

        if (!alreadyIn && !isSuccess)
        {
            //Kid wasn't added to DB
            showMessage("OOPS... Something went wrong and kid " + rblKids.SelectedValue + " wasn't added to activity.", "red", 450);
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

    private void fillActivityInfo(int rowNum)
    {
        if (act.Rows.Count != 0)
        {
            //fill activity card
            tbActID.Text = act.Rows[rowNum]["ID"].ToString();
            tbActName.Text = act.Rows[rowNum]["name"].ToString();
            tbOperLastName.Text = act.Rows[rowNum]["surName"].ToString();
            tbOperFirstName.Text = act.Rows[rowNum]["firstName"].ToString();
            tbDayInWeek.Text = act.Rows[rowNum]["dayInWeek"].ToString();
            tbstartTime.Text = act.Rows[rowNum]["startTime"].ToString();
            tbEndTime.Text = act.Rows[rowNum]["endTime"].ToString();
            tbCost.Text = act.Rows[rowNum]["cost"].ToString();

            //fill charts card


            //fill opinions card
            Dictionary<string, object> data = new Dictionary<string, object>();
            data.Add("activityID", tbActID.Text);

            System.Data.DataTable dt = DBConnection.runProcWithResults("getAllActivityOpinions", data);
            foreach (System.Data.DataRow item in dt.Rows)
            {
                System.Web.UI.HtmlControls.HtmlTableRow tr = new System.Web.UI.HtmlControls.HtmlTableRow();
                tr.Attributes.Add("class", int.Parse(item["grade"].ToString()) > 5 ? "success" : "danger");
                System.Web.UI.HtmlControls.HtmlTableCell tc = new System.Web.UI.HtmlControls.HtmlTableCell();
                tc.InnerText = item["talk"].ToString();
                tr.Controls.Add(tc);
                System.Web.UI.HtmlControls.HtmlTableCell tc1 = new System.Web.UI.HtmlControls.HtmlTableCell();
                tc1.InnerText = item["grade"].ToString();
                tr.Controls.Add(tc1);
                opinionTable.Rows.Add(tr);
            }
        }
    }

    protected void btnPrevActivity_Click(object sender, EventArgs e)
    {
        KGManager.log("PREV BUTTON WAS CLICKED: CURR ROW -> " + currRow + " TOTAL NUM OF ROWS -> " + act.Rows.Count);
        if (act.Rows.Count != 0)
        {
            if (currRow == 0)
            {
                currRow = act.Rows.Count - 1;
            }
            else
            {
                currRow--;
            }
            fillActivityInfo(currRow);
        }
        KGManager.log("==================: CURR ROW -> " + currRow + " TOTAL NUM OF ROWS -> " + act.Rows.Count);
    }

    protected void btnNextActivity_Click(object sender, EventArgs e)
    {
        if (act.Rows.Count != 0)
        {
            if (currRow == act.Rows.Count - 1)
            {
                currRow = 0;
            }
            else
            {
                currRow++;
            }
            fillActivityInfo(currRow);
        }
    }

    private void clearAllFields()
    {
        act = new System.Data.DataTable();
        tbActID.Text = "";
        tbActName.Text = "";
        tbOperLastName.Text = "";
        tbOperFirstName.Text = "";
        tbDayInWeek.Text = "";
        tbstartTime.Text = "";
        tbEndTime.Text = "";
        tbCost.Text = "";
    }

    private void clearAllCard()
    {
        activity.Attributes.Remove("class");
        activity.Attributes.Add("class", "container-fluid col-lg-12 hidden");
        charts.Attributes.Remove("class");
        charts.Attributes.Add("class", "container-fluid col-lg-8 hidden");
        opinions.Attributes.Remove("class");
        opinions.Attributes.Add("class", "container-fluid col-lg-4 hidden");
        clearAllFields();
        rblKids.SelectedIndex = -1;
    }

    protected void btnAddKidToActivity_Click(object sender, EventArgs e)
    {
        afterAction = true;
        KGManager.log("add to activity button was clicked");
        //check if ID already exists in DB
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("kidID", rblKids.SelectedValue);
        data.Add("activityID", tbActID.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("checkIfKidAlreadyInActivity", data);
        if (dt.Rows.Count != 0)
        {
            //kid already in activity
            KGManager.log("ID " + rblKids.SelectedValue + " already in activity " + tbActID.Text);
            alreadyIn = true;
        }
        else
        {
            //kid not in activity
            alreadyIn = false;
            dt = DBConnection.runProcWithResults("addKidToActivity", data);
            if (dt.Rows.Count == 1)
            {
                //Kid was added successfully
                KGManager.log("Kid " + rblKids.SelectedValue + " was added to activity " + tbActID.Text);
                isSuccess = true;
            }
            else
            {
                //Kid wasn't added
                KGManager.log("Kid " + rblKids.SelectedValue + " was NOT added to activity " + tbActID.Text);
                isSuccess = false;
            }
        }
        submitData();
        clearAllCard();
    }

}