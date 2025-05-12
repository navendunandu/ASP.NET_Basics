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
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string selUser = "select * from tbl_user where user_id=" + Session["uid"];
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selUser, con);
        adp.Fill(dt);
        String oldPassord = dt.Rows[0]["user_password"].ToString();
        if (oldPassord == txt_oldpassword.Text)
        {
            //if (txt_password.Text == txt_cpassword.Text)
            //{
                string updQry="update tbl_user set user_password='"+txt_password.Text+"' where user_id=" + Session["uid"];
                SqlCommand cmd = new SqlCommand(updQry, con);
                cmd.ExecuteNonQuery();
                string script = "alert('Password Updated!');";
                ClientScript.RegisterStartupScript(this.GetType(), "PasswordUpdated", script, true);
            txt_cpassword.Text = "";
            txt_oldpassword.Text = "";
            txt_password.Text = "";
                dt.Clear();
            //}
        }
        else
        {
            string script = "alert('Password Doesn't Match!');";
            ClientScript.RegisterStartupScript(this.GetType(), "PasswordUpdatedFailed", script, true);
        }
    }
}