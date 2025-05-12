using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_name.Text = Session["uname"].ToString();
    }

    protected void btn_profile_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyProfile.aspx");
    }

    protected void btn_edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditProfile.aspx");
    }

    protected void btn_pass_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
    }
}