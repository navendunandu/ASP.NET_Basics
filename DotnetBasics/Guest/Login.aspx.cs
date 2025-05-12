using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Guest_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source = DESKTOP-N4JNRRR;Initial Catalog=db_new;Integrated Security=True");
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
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        string selUser = "select * from tbl_user where user_email='" + txt_email.Text + "' and user_password='" + txt_password.Text + "'";
        SqlDataAdapter adp = new SqlDataAdapter(selUser, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["uid"] = dt.Rows[0]["user_id"].ToString();
            Session["uname"] = dt.Rows[0]["user_name"].ToString();
            Response.Redirect("../User/Homepage.aspx");
        }
        else
        {
            string script = "alert('Invalid Credentials');";
            ClientScript.RegisterStartupScript(this.GetType(), "InvalidCredentials", script, true);
        }
    }
}