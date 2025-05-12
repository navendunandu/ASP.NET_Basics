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
    static int editId = 0;
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
        if (editId == 0)
        {
            string insQry = "insert into tbl_category(category_name) values('" + txt_category.Text + "')";
            SqlCommand cmd = new SqlCommand(insQry, con);
            cmd.ExecuteNonQuery();
            txt_category.Text = "";
        }
        else
        {
            string editQry = "update tbl_category set category_name='"+ txt_category.Text + "' where category_id=" + editId;
            SqlCommand cmd = new SqlCommand(editQry, con);
            cmd.ExecuteNonQuery();
            txt_category.Text = "";
            editId = 0;
        }
        fillGrid();
    }

    protected void fillGrid()
    {
        string selQry = "select * from tbl_category";
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(selQry, con);
        adp.Fill(dt);
        grdCategory.DataSource = dt;
        grdCategory.DataBind();
    }

    protected void grdCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void grdCategory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int categoryId = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "DeleteCat")
        {
            string delQry = "delete from tbl_category where category_id=" + categoryId;
            SqlCommand cmd = new SqlCommand(delQry, con);
            cmd.ExecuteNonQuery();
            fillGrid();
        }
        else
        {
            string eQry = "select category_name from tbl_category where category_id=" + categoryId;
            SqlDataAdapter adp = new SqlDataAdapter(eQry, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            txt_category.Text = dt.Rows[0]["category_name"].ToString();
            editId = categoryId;
        }
    }
}