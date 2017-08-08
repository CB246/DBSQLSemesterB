using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class aspx_Opinions_Add : System.Web.UI.Page
{
    private static bool isSuccess = false;
    private static bool afterAction = false;
    private static bool isAdd = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (KGManager.userLogin.Equals("Admin"))
        {
            addKgOpinion.Attributes.Add("hidden", "true");
            addActOpinion.Attributes.Add("hidden", "true");
            removeActOpinion.Attributes.Remove("hidden");
            removeKgOpinion.Attributes.Remove("hidden");
        }
        else
        {
            removeActOpinion.Attributes.Add("hidden", "true");
            removeKgOpinion.Attributes.Add("hidden", "true");
            addKgOpinion.Attributes.Remove("hidden");
            addActOpinion.Attributes.Remove("hidden");
        }

        if (IsPostBack)
        {
            if (afterAction)
            {
                submitData();
                isSuccess = false;
                afterAction = false;
                isAdd = false;
                lbKgOpinionID.Items.Clear();
                lbActOpinionID.Items.Clear();
            }
        }
        else
        {
            lbAct.Items.Clear();
            lbKG.Items.Clear();
            // fill all KGs     -   getAllKgNum
            foreach (System.Data.DataRow item in DBConnection.runProcWithResults("getAllKgNum", new Dictionary<string, object>()).Rows)
            {
                lbKG.Items.Add(item["ID"].ToString());
            }

            // fill all Acts    -   getAllActNum
            foreach (System.Data.DataRow item in DBConnection.runProcWithResults("getAllActNum", new Dictionary<string, object>()).Rows)
            {
                lbAct.Items.Add(item["ID"].ToString());
            }
            lbKgOpinionID.Items.Clear();
            lbActOpinionID.Items.Clear();
        }
        fillOpinions("Kg", DBConnection.runProcWithResults("getKgNumsInOpinion", new Dictionary<string, object>()));
        fillOpinions("Act", DBConnection.runProcWithResults("getActNumsInOpinion", new Dictionary<string, object>()));
    }

    private void fillOpinions(string type, System.Data.DataTable dt)
    {
        foreach (System.Data.DataRow item in dt.Rows)
        {
            HtmlGenericControl panelPrimary = new HtmlGenericControl("div");
            panelPrimary.Attributes.Add("class", "panel panel-primary");
            HtmlGenericControl panelHeading = new HtmlGenericControl("div");
            panelHeading.Attributes.Add("class", "panel-heading");
            panelHeading.Attributes.Add("role", "tab");
            panelHeading.Attributes.Add("id", type + item["ID"].ToString());
            HtmlGenericControl panelTitle = new HtmlGenericControl("h4");
            panelTitle.Attributes.Add("class", "panel-title");
            HtmlGenericControl button = new HtmlGenericControl("a");
            button.Attributes.Add("role", "button");
            button.Attributes.Add("data-toggle", "collapse");
            button.Attributes.Add("data-parent", "#" + type + "Opinions");
            button.Attributes.Add("href", "#collapse" + type + item["ID"].ToString());
            button.Attributes.Add("aria-expanded", "false");
            button.Attributes.Add("aria-controls", "collapse" + type + item["ID"].ToString());
            button.Attributes.Add("class", "collapsed");
            if (type.Equals("Kg"))
            {
                button.InnerText = "Kindergarden " + item["ID"].ToString() + " - " + item["name"].ToString();
            }
            else
            {
                button.InnerText = "Activity " + item["ID"].ToString() + " - " + item["name"].ToString();
            }
            HtmlGenericControl panelCollapse = new HtmlGenericControl("div");
            panelCollapse.Attributes.Add("id", "collapse" + type + item["ID"].ToString());
            panelCollapse.Attributes.Add("class", "panel-collapse collapse");
            panelCollapse.Attributes.Add("role", "tabpanel");
            panelCollapse.Attributes.Add("aria-labelledby", type + item["ID"].ToString());
            panelCollapse.Attributes.Add("aria-expanded", "false");
            panelCollapse.Attributes.Add("style", "height: 0px;");
            HtmlGenericControl panelBody = new HtmlGenericControl("div");
            panelBody.Attributes.Add("class", "panel-body");

            panelTitle.Controls.Add(button);
            panelHeading.Controls.Add(panelTitle);
            panelPrimary.Controls.Add(panelHeading);

            panelBody.Controls.Add(fillOpinionTable(type, item["ID"].ToString()));
            panelCollapse.Controls.Add(panelBody);
            panelPrimary.Controls.Add(panelCollapse);

            if (type.Equals("Kg"))
            {
                kgOpinions.Controls.Add(panelPrimary);
            }
            else
            {
                actOpinions.Controls.Add(panelPrimary);
            }
        }
    }

    private HtmlGenericControl fillOpinionTable(string type, string num)
    {
        HtmlGenericControl table = new HtmlGenericControl("div");
        table.Attributes.Add("class", "table-responsive");
        HtmlGenericControl wrapper = new HtmlGenericControl("div");
        wrapper.Attributes.Add("id", type + num + "-wrapper");
        wrapper.Attributes.Add("class", "dataTables_wrapper form-inline dt-bootstrap");
        HtmlGenericControl row = new HtmlGenericControl("div");
        row.Attributes.Add("class", "row col-sm-12");
        row.Attributes.Add("style", "margin-bottom: 0px;");
        HtmlGenericControl data = new HtmlGenericControl("table");
        data.Attributes.Add("class", "table table-bordered table-striped table-hover js-basic-example dataTable");
        data.Attributes.Add("id", type + num);
        data.Attributes.Add("role", "grid");
        data.Attributes.Add("aria-describedby", type + num + "-info");
        HtmlGenericControl head = new HtmlGenericControl("thead");
        HtmlGenericControl tr = new HtmlGenericControl("tr");
        tr.Attributes.Add("role", "row");
        HtmlGenericControl th1 = new HtmlGenericControl("th");
        th1.Attributes.Add("class", "sorting_asc");
        th1.Attributes.Add("tabindex", "0");
        th1.Attributes.Add("aria-controls", type + num);
        th1.Attributes.Add("rowspan", "1");
        th1.Attributes.Add("colspan", "1");
        th1.Attributes.Add("aria-sort", "ascending");
        th1.InnerText = "ID";
        HtmlGenericControl th2 = new HtmlGenericControl("th");
        th2.Attributes.Add("class", "sorting");
        th2.Attributes.Add("tabindex", "0");
        th2.Attributes.Add("aria-controls", type + num);
        th2.Attributes.Add("rowspan", "1");
        th2.Attributes.Add("colspan", "1");
        th2.InnerText = "Opinion";
        HtmlGenericControl th3 = new HtmlGenericControl("th");
        th3.Attributes.Add("class", "sorting");
        th3.Attributes.Add("tabindex", "0");
        th3.Attributes.Add("aria-controls", type + num);
        th3.Attributes.Add("rowspan", "1");
        th3.Attributes.Add("colspan", "1");
        th3.InnerText = "Grade";
        HtmlGenericControl body = new HtmlGenericControl("tbody");
        Dictionary<string, object> dict = new Dictionary<string, object>();
        dict.Add(type + "ID", num);

        int i = 0, sum = 0;
        System.Data.DataTable dt = DBConnection.runProcWithResults("getAllOpinionsOf" + type, dict);
        foreach (System.Data.DataRow item in dt.Rows)
        {
            HtmlGenericControl innerTr = new HtmlGenericControl("tr");
            innerTr.Attributes.Add("role", "row");
            innerTr.Attributes.Add("class", ((i++ % 2) == 0) ? "odd" : "even");
            HtmlGenericControl td1 = new HtmlGenericControl("td");
            td1.Attributes.Add("class", "sorting_1");
            td1.InnerText = item["ID"].ToString();
            HtmlGenericControl td2 = new HtmlGenericControl("td");
            td2.InnerText = item["text"].ToString();
            HtmlGenericControl td3 = new HtmlGenericControl("td");
            td3.InnerText = item["grade"].ToString();
            sum += int.Parse(item["grade"].ToString());
            innerTr.Controls.Add(td1);
            innerTr.Controls.Add(td2);
            innerTr.Controls.Add(td3);
            body.Controls.Add(innerTr);
            if (type.Equals("Kg"))
                lbKgOpinionID.Items.Add(item["ID"].ToString());
            else
                lbActOpinionID.Items.Add(item["ID"].ToString());
        }

        HtmlGenericControl foot = new HtmlGenericControl("tfoot");
        HtmlGenericControl trFoot = new HtmlGenericControl("tr");
        trFoot.Attributes.Add("role", "row");
        HtmlGenericControl th4 = new HtmlGenericControl("th");
        th4.Attributes.Add("class", "sorting");
        th4.Attributes.Add("tabindex", "0");
        th4.Attributes.Add("aria-controls", type + num);
        th4.Attributes.Add("rowspan", "1");
        th4.Attributes.Add("colspan", "1");
        th4.InnerText = ((double)sum/i).ToString();
        HtmlGenericControl th5 = new HtmlGenericControl("th");
        th5.InnerText = "Average:";
        th5.Attributes.Add("class", "align-right");
        HtmlGenericControl th6 = new HtmlGenericControl("th");

        tr.Controls.Add(th1);
        tr.Controls.Add(th2);
        tr.Controls.Add(th3);
        trFoot.Controls.Add(th6);
        trFoot.Controls.Add(th5);
        trFoot.Controls.Add(th4);
        foot.Controls.Add(trFoot);
        head.Controls.Add(tr);
        data.Controls.Add(head);
        data.Controls.Add(body);
        data.Controls.Add(foot);
        row.Controls.Add(data);
        wrapper.Controls.Add(row);
        table.Controls.Add(wrapper);

        return table;
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
        lbKG.SelectedIndex = 0;
        tbKgOpinion.Text = "";
        lbKgGrade.SelectedIndex = 0;
        lbKgOpinionID.SelectedIndex = 0;
        lbAct.SelectedIndex = 0;
        tbActopinion.Text = "";
        lbActGrade.SelectedIndex = 0;
        lbActOpinionID.SelectedIndex = 0;
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

    protected void btnAddKgOpinion_Click(object sender, EventArgs e)
    {
        addOpinion("Kg", lbKG.SelectedValue, tbKgOpinion.Text, lbKgGrade.SelectedValue);
    }

    protected void btnAddActOpinion_Click(object sender, EventArgs e)
    {
        addOpinion("Act", lbAct.SelectedValue, tbActopinion.Text, lbActGrade.SelectedValue);
    }

    private void addOpinion(string type, string id, string text, string grade)
    {
        afterAction = true;
        isAdd = true;

        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("id", id);
        data.Add("text", text);
        data.Add("grade", grade);

        System.Data.DataTable dt = DBConnection.runProcWithResults("addOpinionTo" + type, data);
        isSuccess = dt.Rows.Count != 0;
        submitData();
    }

    protected void submitData()
    {
        if (isAdd && !isSuccess)
        {
            //ID already in DB - can't add new kid
            showMessage("Your opinion wasn't added.", "red", 250);
        }

        if (isAdd && isSuccess)
        {
            //Kid was added successfully to DB
            showMessage("Your opinion was added successfully.", "green", 300);
        }

        if (!isAdd && !isSuccess)
        {
            //Kid wasn't added to DB
            showMessage("Chosen opinion wasn't removed.", "red", 300);
        }

        if (!isAdd && isSuccess)
        {
            //Kid wasn't added to DB
            showMessage("Chosen opinion was removed successfully.", "green", 350);
        }
    }

    protected void btnRemoveKgOpinion_Click(object sender, EventArgs e)
    {
        removeOpinion(lbKgOpinionID.SelectedValue);
    }

    protected void btnRemoveActOpinion_Click(object sender, EventArgs e)
    {
        removeOpinion(lbActOpinionID.SelectedValue);
    }

    private void removeOpinion(string id)
    {
        afterAction = true;
        isAdd = false;

        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("id", id);

        System.Data.DataTable dt = DBConnection.runProcWithResults("removeOpinion", data);
        isSuccess = dt.Rows.Count == 0;
        submitData();
    }
}
