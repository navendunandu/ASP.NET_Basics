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
            fillDist();
            fillGrid();
        }
    }

    protected void fillDist()
    {
        string selDist = "select * from tbl_dist";
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selDist, con);
        adp.Fill(dt);
        sel_dist.DataSource = dt;
        sel_dist.DataTextField = "district_name";
        sel_dist.DataValueField = "district_id";
        sel_dist.DataBind();
    }

    protected void fillGrid()
    {
        string selQry = "select * from tbl_place p inner join tbl_dist d on d.district_id=p.district_id";
        SqlDataAdapter adp = new SqlDataAdapter(selQry, con);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        grdPlace.DataSource = dt;
        grdPlace.DataBind();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string insQry = "insert into tbl_place (place_name,district_id) values('"+txt_place.Text+"','"+sel_dist.Text+"')";
        SqlCommand cmd = new SqlCommand(insQry, con);
        cmd.ExecuteNonQuery();
        txt_place.Text = "";
        fillGrid();
    }

    protected void grdPlace_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void grdPlace_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int placeId = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "DeletePlace")
        {
            string delQry = "delete from tbl_place where place_id=" + placeId;
            SqlCommand cmd = new SqlCommand(delQry, con);
            cmd.ExecuteNonQuery();
            fillGrid();
        }
    }
}