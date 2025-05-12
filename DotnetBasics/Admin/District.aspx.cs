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

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string insQry = "INSERT into tbl_dist(district_name) values('"+ txt_district.Text +"')";
        SqlCommand cmd = new SqlCommand(insQry, con);
        cmd.ExecuteNonQuery();
        txt_district.Text = "";
        fillGrid();
    }

    protected void fillGrid()
    {
        string selQry = "select * from tbl_dist";
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selQry, con);
        adp.Fill(dt);
        grdDistrict.DataSource = dt;
        grdDistrict.DataBind();
    }

    protected void grdDistrict_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {

    }

    protected void grdDistrict_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteDist")
        {
            int districtId = Convert.ToInt32(e.CommandArgument.ToString());
            string delQry = "delete from tbl_dist where district_id='" + districtId + "'";
            SqlCommand cmd = new SqlCommand(delQry, con);
            cmd.ExecuteNonQuery();
            
            fillGrid();
        }
    }

    protected void grdDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}