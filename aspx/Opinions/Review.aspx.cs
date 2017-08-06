using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class aspx_Opinions_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            button.InnerText = type + " " + item["ID"].ToString();
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
                kgOpinions.Controls.Add(panelPrimary);
            else
                actOpinions.Controls.Add(panelPrimary);
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
        th1.InnerText = "Opinion";
        HtmlGenericControl th2 = new HtmlGenericControl("th");
        th2.Attributes.Add("class", "sorting");
        th2.Attributes.Add("tabindex", "0");
        th2.Attributes.Add("aria-controls", type + num);
        th2.Attributes.Add("rowspan", "1");
        th2.Attributes.Add("colspan", "1");
        th2.InnerText = "grade";
        HtmlGenericControl body = new HtmlGenericControl("tbody");
        Dictionary<string, object> dict = new Dictionary<string, object>();
        dict.Add(type + "ID", num);

        int i = 0;
        System.Data.DataTable dt = DBConnection.runProcWithResults("getAllOpinionsOf" + type, dict);
        foreach (System.Data.DataRow item in dt.Rows)
        {
            HtmlGenericControl innerTr = new HtmlGenericControl("tr");
            innerTr.Attributes.Add("role", "row");
            innerTr.Attributes.Add("class", ((i % 2) == 0) ? "odd" : "even");
            HtmlGenericControl td1 = new HtmlGenericControl("td");
            td1.Attributes.Add("class", "sorting_1");
            td1.InnerText = item["text"].ToString();
            HtmlGenericControl td2 = new HtmlGenericControl("td");
            td2.InnerText = item["grade"].ToString();
            innerTr.Controls.Add(td1);
            innerTr.Controls.Add(td2);
            body.Controls.Add(innerTr);
        }

        tr.Controls.Add(th1);
        tr.Controls.Add(th2);
        head.Controls.Add(tr);
        data.Controls.Add(head);
        data.Controls.Add(body);
        row.Controls.Add(data);
        wrapper.Controls.Add(row);
        table.Controls.Add(wrapper);

        return table;
    }
}
