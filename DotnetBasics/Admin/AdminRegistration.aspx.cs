using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source = DESKTOP-N4JNRRR;Initial Catalog=db_new;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        if (!IsPostBack)
        {
            fillGrid();
        }
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        string insQry = "insert into tbl_admin(admin_name,admin_email,admin_password) values('" + txt_name.Text + "','" + txt_email.Text + "','" + txt_pass.Text + "')";
        SqlCommand cmd = new SqlCommand(insQry, con);
        cmd.ExecuteNonQuery();
        txt_email.Text = "";
        txt_cpass.Text = "";
        txt_pass.Text = "";
        txt_name.Text = "";
        fillGrid();
    }

    protected void fillGrid()
    {
        string selQry = "select * from tbl_admin";
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selQry, con);
        adp.Fill(dt);
        grdAdmins.DataSource = dt;
        grdAdmins.DataBind();
    }

    protected void grdAdmins_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void grdAdmins_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int adminId = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "DeleteAdmin")
        {
            string delQry = "delete from tbl_admin where admin_id=" + adminId;
            SqlCommand cmd = new SqlCommand(delQry, con);
            cmd.ExecuteNonQuery();
            fillGrid();
        }
    }

}