using System;
using System.Collections.Generic;

public partial class aspx_Kids : System.Web.UI.Page
{
    private static double MIN_LATITUDE = 29.55805;
    private static double MAX_LATITUDE = 33.20733;
    private static double MIN_LONGITUDE = 34.57149;
    private static double MAX_LONGITUDE = 35.57212;

    private static TabType tabType = TabType.NONE;
    private static bool isSuccess = false;
    private static bool alreadyIn = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        KGManager.log("kids page was loaded");
        if (!KGManager.userLogin.Equals("Admin"))
        {
            //PopulateList();
            addTabButton.Attributes.Remove("class");
            addTabButton.Attributes.Add("class", "btn bg-cyan waves-effect");
            changeTabButton.Attributes.Remove("class");
            changeTabButton.Attributes.Add("class", "btn bg-cyan waves-effect hidden");
            removeTabButton.Attributes.Remove("class");
            removeTabButton.Attributes.Add("class", "btn bg-cyan waves-effect");
        }
        else
        {
            addTabButton.Attributes.Remove("class");
            addTabButton.Attributes.Add("class", "btn bg-cyan waves-effect hidden");
            changeTabButton.Attributes.Remove("class");
            changeTabButton.Attributes.Add("class", "btn bg-cyan waves-effect");
            removeTabButton.Attributes.Remove("class");
            removeTabButton.Attributes.Add("class", "btn bg-cyan waves-effect hidden");
        }
        if (IsPostBack)
        {
            // page refreshed
            submitData();
        }
        else
        {
            //page loaded first time
            tabType = TabType.NONE;
            isSuccess = false;
            alreadyIn = false;
        }
    }

    private void PopulateList()
    {
        // Define your value and text field here.
        rblKids.DataValueField = "parentId";
        rblKids.DataTextField = "kidID";

        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("parentID", KGManager.userLogin);

        // use your table instead of GetData() to pouplate the radio list.
        rblKids.DataSource = DBConnection.runProcWithResults("getAllKidsOfParent", data);
        rblKids.DataBind();
    }

    protected void btnGetLongAndLat_Click(object sender, EventArgs e)
    {
        setLongAndLat();
    }

    private void setLongAndLat()
    {
        tabType = TabType.ADD;
        Random rand = new Random();
        tbLatitude.Text = (MIN_LATITUDE + rand.NextDouble() * (MAX_LATITUDE - MIN_LATITUDE)).ToString().Substring(0, 8);
        tbLongitude.Text = (MIN_LONGITUDE + rand.NextDouble() * (MAX_LONGITUDE - MIN_LONGITUDE)).ToString().Substring(0, 8);
        tgKindergardens.Visible = true;
        populateKindergardens();
    }

    private void populateKindergardens()
    {
        //populate public KG
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("dateOfBirth", tbDOB.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("findAllPublicKGbyDate", data);
        System.Data.DataRow closestKG = null;
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
        fillKGInfo(closestKG);

        //populate private KG
    }

    private double checkDist(double longitude, double latitude)
    {
        return Math.Sqrt(Math.Pow(longitude - double.Parse(tbLongitude.Text), 2) + Math.Pow(latitude - double.Parse(tbLatitude.Text), 2));
    }

    private void fillKGInfo(System.Data.DataRow row)
    {
        if (row != null)
        {
            tbKgID.Text = row["ID"].ToString();
            tbKGname.Text = row["KGname"].ToString();
            tbClNum.Text = row["number"].ToString();
            tbClName.Text = row["CLname"].ToString();
            tbKGStreet.Text = row["street"].ToString();
            tbKGhouseNum.Text = row["houseNumber"].ToString();
            int current = int.Parse(row["kidsInClass"].ToString());
            int max = int.Parse(row["maximumKids"].ToString());
            progressBarDiv.Attributes.CssStyle.Value = "width: " + (double)current/max + "%;";
            lblPublicProgressBar.Text = row["kidsInClass"].ToString() + "/" + row["maximumKids"].ToString() + " Kids in this class";
        }
    }

    protected void submitData()
    {
        switch (tabType)
        {
            case TabType.ADD:

                if (alreadyIn && !isSuccess)
                {
                    //ID already in DB - can't add new kid
                    showMessage("This ID is already in DataBase.", "red", 250);
                }

                if (isSuccess)
                {
                    //Kid was added successfully to DB
                    showMessage("Kid " + tbID.Text + " was added successfully to DataBase.", "green", 350);
                }
                
                if (!alreadyIn && !isSuccess)
                {
                    //Kid wasn't added to DB
                    showMessage("OOPS... Something went wrong and kid " + tbID.Text + " wasn't added to DataBase.", "red", 250);
                }

                break;
            case TabType.CHANGE:
                break;
            case TabType.REMOVE:
                break;
            case TabType.NONE:
                break;
        }
    }

    protected void btnAddKidToPublic_Click(object sender, EventArgs e)
    {
        KGManager.log("Add kid button was clicked");
        tabType = TabType.ADD;
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
    }

    private enum TabType
    {
        ADD,
        CHANGE,
        REMOVE,
        NONE
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

    protected void btnAddKidToPrivate_Click(object sender, EventArgs e)
    {
        KGManager.log("ADD TO PRIVATE WAS CLICKED");
    }
}