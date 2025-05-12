using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class User_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source = DESKTOP-N4JNRRR;Initial Catalog=db_new;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        if (!IsPostBack)
        {
            rvDob.MaximumValue = DateTime.Today.AddYears(-18).ToString("yyyy-MM-dd");
            fillDistrict();
            getUser();
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        // Register jQuery CDN for unobtrusive validation
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
        {
            CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js",
            CdnDebugPath = "https://code.jquery.com/jquery-3.6.0.js",
            Path = "https://code.jquery.com/jquery-3.6.0.min.js" // Fallback path (can be same as CdnPath)
        });
    }

    protected void fillDistrict()
    {
        string selQry = "select * from tbl_dist";
        SqlDataAdapter adp = new SqlDataAdapter(selQry, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        sel_dist.DataSource = dt;
        sel_dist.DataTextField = "district_name";
        sel_dist.DataValueField = "district_id";
        sel_dist.DataBind();
        sel_dist.Items.Insert(0, "Select District");
    }
    
    protected void fillPlace(int district)
    {
        string selPlace = "select * from tbl_place where district_id="+district;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selPlace, con);
        adp.Fill(dt);
        sel_place.DataSource = dt;
        sel_place.DataTextField = "place_name";
        sel_place.DataValueField = "place_id";
        sel_place.DataBind();
        sel_place.Items.Insert(0, "Select Place");
    }

    protected void getUser()
    {
        string userQry = "select * from tbl_user u inner join tbl_place p on p.place_id=u.place_id inner join tbl_dist d on d.district_id=p.district_id where user_id=" + Session["uid"];
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(userQry, con);
        adp.Fill(dt);
        fillPlace(Convert.ToInt32(dt.Rows[0]["district_id"].ToString()));
        txt_name.Text = dt.Rows[0]["user_name"].ToString();
        txt_email.Text = dt.Rows[0]["user_email"].ToString();
        txt_contact.Text = dt.Rows[0]["user_contact"].ToString();
        txt_address.Text = dt.Rows[0]["user_address"].ToString();
        txt_dob.Text = dt.Rows[0]["user_dob"].ToString();
        rad_gender.Text= dt.Rows[0]["user_gender"].ToString();
        sel_dist.SelectedValue = dt.Rows[0]["district_id"].ToString();
        sel_dist.DataBind();
        sel_place.SelectedValue = dt.Rows[0]["place_id"].ToString();
       
    }
    protected void sel_dist_SelectedIndexChanged(object sender, EventArgs e)
    {
        sel_place.Items.Clear();
        string selPlace = "select * from tbl_place where district_id='" + sel_dist.SelectedValue + "'";
        Console.WriteLine(selPlace);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selPlace, con);
        adp.Fill(dt);
        sel_place.DataSource = dt;
        sel_place.DataTextField = "place_name";
        sel_place.DataValueField = "place_id";
        sel_place.DataBind();
        sel_place.Items.Insert(0, "Select Place");
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        string updQry = "update tbl_user set user_name='" + txt_name.Text + "', user_email='" + txt_email.Text + "', user_contact='" + txt_contact.Text + "',user_address='" + txt_address.Text + "',user_dob='" + txt_dob.Text + "',user_gender='" + rad_gender.Text + "',place_id='" +  sel_place.SelectedValue + "' where user_id=" + Session["uid"];
        SqlCommand cmd = new SqlCommand(updQry, con);
        cmd.ExecuteNonQuery();
        string script = "alert('Registration successful!');";
        ClientScript.RegisterStartupScript(this.GetType(), "RegistrationSuccess", script, true);
        Response.Redirect("MyProfile.aspx");
    }
}