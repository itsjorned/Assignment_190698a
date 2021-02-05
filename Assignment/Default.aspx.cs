using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    DataSet dset = new DataSet();
            //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            //    using (conn)
            //    {
            //       conn.Open();
            //      SqlDataAdapter adapter = new SqlDataAdapter();
            //string sqlQuery = string.Format("SELECT userID,name, email FROM user_info WHERE userID =@0");
            //SqlCommand cmd = new SqlCommand(sqlQuery, conn);
            //cmd.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@0", txtUserID.Text);
            //adapter.SelectCommand = cmd;
            //adapter.Fill(dset);
            //gvUserInfo.DataSource = dset;
            //gvUserInfo.DataBind();

            //    }
            //}

            //protected void BtnSubmit_Click(object sender, EventArgs e)
            //{
            //    DataSet dset = new DataSet();
            //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            //    using (conn)
            //    {
            //        if (txtUserID.Text != string.Empty)
            //        {
            //            conn.Open();
            //            SqlDataAdapter adapter = new SqlDataAdapter();
            //            string sqlQuery = string.Format("SELECT userID,name, email FROM user_info WHERE userID ={0}", txtUserID.Text);
            //            SqlCommand cmd = new SqlCommand(sqlQuery, conn);
            //            cmd.CommandType = CommandType.Text;
            //            adapter.SelectCommand = cmd;
            //            adapter.Fill(dset);
            //            gvUserInfo.DataSource = dset;
            //            gvUserInfo.DataBind();
            //        }
            //    }
            //}


            //Try {
            //    //All DB CODES
            //}
            //Catch(SqlException ex) {
            //    // Include a label to present some comments to the user
            //    Lbl_error.Text = “Invalid search input!”;
            //}
        }
    }
}