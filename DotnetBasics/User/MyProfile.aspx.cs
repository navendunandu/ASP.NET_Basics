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
            fillGrid();
        }
    }

    protected void fillGrid()
    {
        string selQry = "select * from tbl_user u inner join tbl_place p on p.place_id=u.place_id inner join tbl_dist d on d.district_id=p.district_id where user_id=" + Session["uid"];
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selQry, con);
        adp.Fill(dt);
        dtlView.DataSource = dt;
        dtlView.DataBind();
    }

   
}