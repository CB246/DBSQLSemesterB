using System;
using System.Collections.Generic;

public partial class aspx_Kids : System.Web.UI.Page
{
    private static double MIN_LATITUDE = 29.55805;
    private static double MAX_LATITUDE = 33.20733;
    private static double MIN_LONGITUDE = 34.57149;
    private static double MAX_LONGITUDE = 35.57212;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!KGManager.userLogin.Equals("Admin"))
        {
            PopulateList();
        }
    }

    private void PopulateList()
    {
        // Define your value and text field here.
        rblKids.DataValueField = "parentId";
        rblKids.DataTextField = "kidID";
        
        Dictionary<string, object> data = new Dictionary<string, object>();
        data.Add("parentID", KGManager.userLogin);
        //check if ID exists in parents table


        // use your table instead of GetData() to pouplate the radio list.
        rblKids.DataSource = DBConnection.runProcWithResults("getAllKidsOfParent", data);
        rblKids.DataBind();
    }

    private void setLongAndLat()
    {
        Random rand = new Random();
        tbLatitude.Text = (MIN_LATITUDE + rand.NextDouble() * (MAX_LATITUDE - MIN_LATITUDE)).ToString().Substring(0, 8);
        tbLongitude.Text = (MIN_LONGITUDE + rand.NextDouble() * (MAX_LONGITUDE - MIN_LONGITUDE)).ToString().Substring(0, 8);
        tgKindergardens.Visible = true;
    }


    protected void btnGetLongAndLat_Click(object sender, EventArgs e)
    {
        setLongAndLat();
    }


    protected void btnAddKidToPublic_Click(object sender, EventArgs e)
    {
        KGManager.log("add to public button");
    }
}