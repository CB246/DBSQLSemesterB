using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_Activities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateKgList();
        }
    }

    private void populateKgList()
    {
        //  getAllKgAndName
        System.Data.DataTable dt = DBConnection.runProcWithResults("getAllKgAndName", new Dictionary<string, object>());
        foreach (System.Data.DataRow item in dt.Rows)
        {
            lbKG.Items.Add(new ListItem(item["ID"].ToString() + " - " + item["name"].ToString()));
        }
    }

    private void populateClassList()
    {
        lbClNum.Items.Clear();
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("kgID", lbKG.SelectedValue.Split(' ')[0]);

        System.Data.DataTable dt = DBConnection.runProcWithResults("getAllClassesOfKg", data);
        foreach (System.Data.DataRow item in dt.Rows)
        {
            lbClNum.Items.Add(new ListItem(item["ID"].ToString() + " - " + item["name"].ToString()));
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

    protected void btnGetAllClassesOfKg_Click(object sender, EventArgs e)
    {
        populateClassList();
    }

    protected void btnGetAllActivitiesOfKg_Click(object sender, EventArgs e)
    {
        clearTable();

        //  getAllActivitiesInChosenClass
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("kgID", lbKG.SelectedValue.Split(' ')[0]);
        data.Add("clNum", lbClNum.SelectedValue.Split(' ')[0]);

        System.Data.DataTable dt = DBConnection.runProcWithResults("getAllActivitiesInChosenClass", data);
        foreach (System.Data.DataRow item in dt.Rows)
        {
            string[] start = item["startTime"].ToString().Split(':');
            int startTime = int.Parse(start[0] + (start[1].Equals("00") ? "0" : "5"));
            string[] end = item["endTime"].ToString().Split(':');
            int endTime = int.Parse(end[0] + (end[1].Equals("00") ? "0" : "5"));
            for (; startTime < endTime; startTime += 5)
            {
                TableCell tc = (TableCell)table1.FindControl("r" + startTime + "c" + item["dayInWeek"].ToString());
                tc.BackColor = System.Drawing.Color.Cyan;
                tc.Text = item["name"].ToString();
            }
        }
    }

    private void clearTable()
    {
        bool firstRow = true;
        foreach (TableRow row in table1.Rows)
        {
            if (firstRow) { firstRow = false; continue; }
            bool firstCell = true;
            foreach (TableCell cell in row.Cells)
            {
                if (firstCell) { firstCell = false; continue; }
                cell.BackColor = System.Drawing.Color.Transparent;
                cell.Text = "";
            }
        }
    }
}