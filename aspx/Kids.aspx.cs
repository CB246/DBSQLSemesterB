using System;
using System.Collections.Generic;

public partial class aspx_Kids : System.Web.UI.Page
{
    private static double MIN_LATITUDE = 29.55805;
    private static double MAX_LATITUDE = 33.20733;
    private static double MIN_LONGITUDE = 34.57149;
    private static double MAX_LONGITUDE = 35.57212;

    private static int status = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!KGManager.userLogin.Equals("Admin"))
        {
            PopulateList();
        }
        if (IsPostBack)
        {
            submitData();
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
        }
    }
    protected void submitData()
    {
        KGManager.log("Submitted");
    }
    protected void btnAddKidToPublic_Click(object sender, EventArgs e)
    {
        KGManager.log("Check");
        /*
        KGManager.log("add to public button was clicked");
        //check if ID already exists in DB
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("parentID", tbID.Text);
        System.Data.DataTable dt = DBConnection.runProcWithResults("checkIfIDExists", data);
        if (dt.Rows.Count != 0)
        {
            //ID already in DB
            KGManager.log("ID " + tbID.Text + " already in DB");

        }
        else
        {
            //ID not in DB
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

            }
            else
            {
                //Kid wasn't added
                KGManager.log("Kid " + tbID.Text + " was NOT added to parent " + KGManager.userLogin);
            }
        }*/
    }
}