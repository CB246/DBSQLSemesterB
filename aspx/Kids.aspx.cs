using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Kids : System.Web.UI.Page
{
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


        // This will select the radio with value 1
        rblKids.SelectedValue = "1";
    }
}