using System;
using System.Collections.Generic;

public partial class aspx_Kids_Add : System.Web.UI.Page
{
    private static double MIN_LATITUDE = 29.55805;
    private static double MAX_LATITUDE = 33.20733;
    private static double MIN_LONGITUDE = 34.57149;
    private static double MAX_LONGITUDE = 35.57212;

    private static bool isSuccess = false;
    private static bool alreadyIn = false;
    private static bool afterAction = false;

    private static System.Data.DataRow closestKG = null;
    private static System.Data.DataTable privateKG = new System.Data.DataTable();
    private static int currRow = 0;

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
            clearAllFields();
        }
        fillChart();
    }

    protected void btnAddKidToPublic_Click(object sender, EventArgs e)
    {
        afterAction = true;
        KGManager.log("add to public button was clicked");
        //check if ID already exists in DB
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("parentID", tbID.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("checkIfIDExists", data);
        if (dt.Rows.Count != 0)
        {
            //ID already in DB
            KGManager.log("ID " + tbID.Text + " already in DB\n\n");
            alreadyIn = true;
        }
        else
        {
            //ID not in DB
            alreadyIn = false;
            data = new Dictionary<string, object>();
            data.Add("kidID", tbID.Text);
            data.Add("firstName", tbFirstName.Text);
            data.Add("surName", tbLastName.Text);
            data.Add("dateOfBirth", tbDOB.Text);
            data.Add("street", tbStreet.Text);
            data.Add("houseNumber", tbHouseNumber.Text);
            data.Add("city", tbCity.Text);
            data.Add("latitude", tbLatitude.Text);
            data.Add("longitude", tbLongitude.Text);
            data.Add("kindergardenID", tbKgID.Text);
            data.Add("classNumber", tbClNum.Text);
            data.Add("parentID", KGManager.userLogin);
            dt = DBConnection.runProcWithResults("addKid", data);
            if (dt.Rows.Count == 1)
            {
                //Kid was added successfully
                KGManager.log("Kid " + tbID.Text + " was added to parent " + KGManager.userLogin);
                isSuccess = true;
            }
            else
            {
                //Kid wasn't added
                KGManager.log("Kid " + tbID.Text + " was NOT added to parent " + KGManager.userLogin);
                isSuccess = false;
            }
        }
        submitData();
        clearAllFields();
    }

    protected void btnGetLongAndLat_Click(object sender, EventArgs e)
    {
        setLongAndLat();
    }

    private void setLongAndLat()
    {
        Random rand = new Random();
        tbLatitude.Text = (MIN_LATITUDE + rand.NextDouble() * (MAX_LATITUDE - MIN_LATITUDE)).ToString().Substring(0, 8);
        tbLongitude.Text = (MIN_LONGITUDE + rand.NextDouble() * (MAX_LONGITUDE - MIN_LONGITUDE)).ToString().Substring(0, 8);
        kgType.Attributes.Remove("class");
        kgType.Attributes.Add("class", "container-fluid");
        populateKindergardens();
    }

    private void populateKindergardens()
    {
        //populate public KG
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("dateOfBirth", tbDOB.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("findAllPublicKGbyDate", data);
        
        double distance = double.MaxValue;
        foreach (System.Data.DataRow row in dt.Rows)
        {
            int maxKids = int.Parse(row["maximumKids"].ToString());
            int currentNumOfKids = int.Parse(row["kidsInClass"].ToString());
            double longitude = double.Parse(row["longitude"].ToString());
            double latitude = double.Parse(row["latitude"].ToString());
            double dist = checkDist(longitude, latitude);
            if (currentNumOfKids < maxKids && dist < distance)
            {
                closestKG = row;
                distance = dist;
            }
        }

        //populate private KG
        privateKG = DBConnection.runProcWithResults("findAllPrivateKGbyDate", data);
    }

    private double checkDist(double longitude, double latitude)
    {
        return Math.Sqrt(Math.Pow(longitude - double.Parse(tbLongitude.Text), 2) + Math.Pow(latitude - double.Parse(tbLatitude.Text), 2));
    }

    private void fillKGInfo()
    {
        if (closestKG != null)
        {
            tbKgID.Text = closestKG["ID"].ToString();
            tbKGname.Text = closestKG["KGname"].ToString();
            tbClNum.Text = closestKG["number"].ToString();
            tbClName.Text = closestKG["CLname"].ToString();
            tbKGStreet.Text = closestKG["street"].ToString();
            tbKGhouseNum.Text = closestKG["houseNumber"].ToString();
            tbKGPrice.Text = closestKG["price"].ToString();
            int current = int.Parse(closestKG["kidsInClass"].ToString());
            int max = int.Parse(closestKG["maximumKids"].ToString());
            progressBarDiv.Attributes.CssStyle.Value = "width: " + ((double)current / max) * 100 + "%;";
            lblPublicProgressBar.Text = current + "/" + max + " Kids in this class";
            tbTeacherLastName.Text = closestKG["surName"].ToString();
            tbTeacherFirstName.Text = closestKG["firstName"].ToString();
            fillOpinion(closestKG["ID"].ToString());
        }
    }

    protected void submitData()
    {
        if (alreadyIn && !isSuccess)
        {
            //ID already in DB - can't add new kid
            showMessage("This ID is already in DataBase.", "red", 250);
        }

        if (isSuccess)
        {
            //Kid was added successfully to DB
            showMessage("Kid " + tbID.Text + " was added successfully to DataBase.", "green", 400);
        }

        if (!alreadyIn && !isSuccess)
        {
            //Kid wasn't added to DB
            showMessage("OOPS... Something went wrong and kid " + tbID.Text + " wasn't added to DataBase.", "red", 450);
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

    private void fillPrivateKGInfo(int rowNum)
    {
        if (privateKG.Rows.Count != 0)
        {
            tbKGidPriv.Text = privateKG.Rows[rowNum]["ID"].ToString();
            tbKGnamePriv.Text = privateKG.Rows[rowNum]["KGname"].ToString();
            tbClNumPriv.Text = privateKG.Rows[rowNum]["number"].ToString();
            tbClNamePriv.Text = privateKG.Rows[rowNum]["CLname"].ToString();
            tbStreetPriv.Text = privateKG.Rows[rowNum]["street"].ToString();
            tbHouseNumPriv.Text = privateKG.Rows[rowNum]["houseNumber"].ToString();
            tbPrivKGPrice.Text = privateKG.Rows[rowNum]["price"].ToString();
            int current = int.Parse(privateKG.Rows[rowNum]["kidsInClass"].ToString());
            int max = int.Parse(privateKG.Rows[rowNum]["maximumKids"].ToString());
            divProgressPrivate.Attributes.CssStyle.Value = "width: " + ((double)current / max) * 100 + "%;";
            lblProgressPrivate.Text = current + "/" + max + " Kids in this class";
            tbPriTeacherLastName.Text = privateKG.Rows[rowNum]["surName"].ToString();
            tbPrivTeacherFirstName.Text = privateKG.Rows[rowNum]["firstName"].ToString();
            fillOpinion(privateKG.Rows[rowNum]["ID"].ToString());
        }
    }

    protected void btnAddKidToPrivate_Click(object sender, EventArgs e)
    {
        afterAction = true;
        KGManager.log("add to private button was clicked");
        //check if ID already exists in DB
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("parentID", tbID.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("checkIfIDExists", data);
        if (dt.Rows.Count != 0)
        {
            //ID already in DB
            KGManager.log("ID " + tbID.Text + " already in DB\n\n");
            alreadyIn = true;
        }
        else
        {
            //ID not in DB
            alreadyIn = false;
            data = new Dictionary<string, object>();
            data.Add("kidID", tbID.Text);
            data.Add("firstName", tbFirstName.Text);
            data.Add("surName", tbLastName.Text);
            data.Add("dateOfBirth", tbDOB.Text);
            data.Add("street", tbStreet.Text);
            data.Add("houseNumber", tbHouseNumber.Text);
            data.Add("city", tbCity.Text);
            data.Add("latitude", tbLatitude.Text);
            data.Add("longitude", tbLongitude.Text);
            data.Add("kindergardenID", tbKGidPriv.Text);
            data.Add("classNumber", tbClNumPriv.Text);
            data.Add("parentID", KGManager.userLogin);
            dt = DBConnection.runProcWithResults("addKid", data);
            if (dt.Rows.Count == 1)
            {
                //Kid was added successfully
                KGManager.log("Kid " + tbID.Text + " was added to parent " + KGManager.userLogin);
                isSuccess = true;
            }
            else
            {
                //Kid wasn't added
                KGManager.log("Kid " + tbID.Text + " was NOT added to parent " + KGManager.userLogin);
                isSuccess = false;
            }
        }
        submitData();
        clearAllFields();
    }

    protected void btnPrevPrivate_Click(object sender, EventArgs e)
    {
        KGManager.log("PREV BUTTON WAS CLICKED: CURR ROW -> " + currRow + " TOTAL NUM OF ROWS -> " + privateKG.Rows.Count);
        if (privateKG.Rows.Count != 0)
        {
            if (currRow == 0)
            {
                currRow = privateKG.Rows.Count - 1;
            }
            else
            {
                currRow--;
            }
            fillPrivateKGInfo(currRow);
        }
        KGManager.log("==================: CURR ROW -> " + currRow + " TOTAL NUM OF ROWS -> " + privateKG.Rows.Count);
    }

    protected void btnNextPrivate_Click(object sender, EventArgs e)
    {
        if (privateKG.Rows.Count != 0)
        {
            if (currRow == privateKG.Rows.Count - 1)
            {
                currRow = 0;
            }
            else
            {
                currRow++;
            }
            fillPrivateKGInfo(currRow);
        }
    }

    protected void btnPublic_Click(object sender, EventArgs e)
    {
        fillKGInfo();
        privKG.Attributes.Remove("class");
        privKG.Attributes.Add("class", "container-fluid hidden");
        pubKG.Attributes.Remove("class");
        pubKG.Attributes.Add("class", "container-fluid");
        charts.Attributes.Remove("class");
        charts.Attributes.Add("class", "container-fluid col-lg-8");
        opinions.Attributes.Remove("class");
        opinions.Attributes.Add("class", "container-fluid col-lg-4");
    }

    protected void btnPrivate_Click(object sender, EventArgs e)
    {
        fillPrivateKGInfo(currRow);
        pubKG.Attributes.Remove("class");
        pubKG.Attributes.Add("class", "container-fluid hidden");
        privKG.Attributes.Remove("class");
        privKG.Attributes.Add("class", "container-fluid");
        charts.Attributes.Remove("class");
        charts.Attributes.Add("class", "container-fluid col-lg-8");
        opinions.Attributes.Remove("class");
        opinions.Attributes.Add("class", "container-fluid col-lg-4");
    }

    private void clearAllFields()
    {
        kgType.Attributes.Remove("class");
        kgType.Attributes.Add("class", "container-fluid hidden");
        pubKG.Attributes.Remove("class");
        pubKG.Attributes.Add("class", "container-fluid hidden");
        privKG.Attributes.Remove("class");
        privKG.Attributes.Add("class", "container-fluid hidden");
        charts.Attributes.Remove("class");
        charts.Attributes.Add("class", "container-fluid col-lg-8 hidden");
        opinions.Attributes.Remove("class");
        opinions.Attributes.Add("class", "container-fluid col-lg-4 hidden");
        privateKG = new System.Data.DataTable();
        tbID.Text = "";
        tbLastName.Text = "";
        tbFirstName.Text = "";
        tbDOB.Text = "";
        tbCity.Text = "";
        tbStreet.Text = "";
        tbHouseNumber.Text = "";
        tbLongitude.Text = "";
        tbLatitude.Text = "";
    }

    private void fillOpinion(string kgNum)
    {
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("kgID", kgNum);

        System.Data.DataTable dt = DBConnection.runProcWithResults("getAllKgOpinions", data);
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

    private void fillChart()
    {
        //  getKgInfoForChart
        System.Data.DataTable dt = DBConnection.runProcWithResults("getKgInfoForChart", new Dictionary<string, object>());

        string names = "[";
        string avers = "[";
        string totals = "[";

        foreach (System.Data.DataRow item in dt.Rows)
        {
            names += "\"" + item["name"].ToString() + "\",";
            avers += item["aver"].ToString() + ",";
            totals += item["total"].ToString() + ",";
        }

        names = names.Substring(0, names.Length - 1) + "]";
        avers = avers.Substring(0, avers.Length - 1) + "]";
        totals = totals.Substring(0, totals.Length - 1) + "]";

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "fillCharts(" + names + ", " + avers + ", " + totals + ")", true);
    }
}