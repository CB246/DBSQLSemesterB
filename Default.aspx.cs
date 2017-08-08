using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillChart();
    }

    private void fillChart()
    {
        //  getKgInfoForChart
        System.Data.DataTable dt = DBConnection.runProcWithResults("getKgInfoForChart", new Dictionary<string, object>());

        string namesKG = "[";
        string aversKG = "[";
        string totalsKG = "[";

        foreach (System.Data.DataRow item in dt.Rows)
        {
            namesKG += "\"" + item["name"].ToString() + "\",";
            aversKG += item["aver"].ToString() + ",";
            totalsKG += item["total"].ToString() + ",";
        }

        namesKG = namesKG.Substring(0, namesKG.Length - 1) + "]";
        aversKG = aversKG.Substring(0, aversKG.Length - 1) + "]";
        totalsKG = totalsKG.Substring(0, totalsKG.Length - 1) + "]";

        //  getActInfoForChart
        System.Data.DataTable dt1 = DBConnection.runProcWithResults("getActInfoForChart", new Dictionary<string, object>());

        string namesAct = "[";
        string aversAct = "[";
        string totalsAct = "[";

        foreach (System.Data.DataRow item in dt1.Rows)
        {
            namesAct += "\"" + item["name"].ToString() + "\",";
            aversAct += item["aver"].ToString() + ",";
            totalsAct += item["total"].ToString() + ",";
        }

        namesAct = namesAct.Substring(0, namesAct.Length - 1) + "]";
        aversAct = aversAct.Substring(0, aversAct.Length - 1) + "]";
        totalsAct = totalsAct.Substring(0, totalsAct.Length - 1) + "]";

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "fillCharts(" + namesKG + ", " + aversKG + ", " + totalsKG + ", " + namesAct + ", " + aversAct + ", " + totalsAct + ")", true);
    }
}