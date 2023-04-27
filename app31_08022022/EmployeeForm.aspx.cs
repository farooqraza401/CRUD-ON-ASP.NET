using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace app31_08022022
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGrid();
                showDesignation();
                showqualification();
                showcountry();
                ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
                ddlcity.Enabled = false;
            }
        }

        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JOIN");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            gvwemployee.DataSource = dt;
            gvwemployee.DataBind();    
        }

        public void showDesignation()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "DESIGNATION");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddldesignation.DataValueField = "designation_id";
            ddldesignation.DataTextField = "designation_name";
            ddldesignation.DataSource = dt;
            ddldesignation.DataBind();
            ddldesignation.Items.Insert(0, new ListItem("--Select--", "0"));
                
        }

        public void showqualification()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "QUALIFICATION");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlqualification.DataValueField = "qualification_id";
            ddlqualification.DataTextField = "qualification_name";
            ddlqualification.DataSource = dt;
            ddlqualification.DataBind();
            ddlqualification.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        public void showcity()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "CITY");
            cmd.Parameters.AddWithValue("@country_id", ddlcountry.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcity.Enabled = true;
            ddlcity.DataValueField = "city_id";
            ddlcity.DataTextField = "city_name";
            ddlcity.DataSource = dt;
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void showcountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "COUNTRY");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlcountry.DataValueField = "country_id";
            ddlcountry.DataTextField = "country_name";
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("--Select--", "0"));

        }
        protected void btninsert_Click(object sender, EventArgs e)
        {
            if (btninsert.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "INSERT");
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@designation_id", ddldesignation.SelectedValue);
                cmd.Parameters.AddWithValue("@salary", txtsalary.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@mob", txtmobileno.Text);
                cmd.Parameters.AddWithValue("@qualification_id", ddlqualification.SelectedValue);
                cmd.Parameters.AddWithValue("@city_id", ddlcity.SelectedValue);
                cmd.Parameters.AddWithValue("@country_id", ddlcountry.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "UPDATE");
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@designation_id", ddldesignation.SelectedValue);
                cmd.Parameters.AddWithValue("@salary", txtsalary.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@mob", txtmobileno.Text);
                cmd.Parameters.AddWithValue("@qualification_id", ddlqualification.SelectedValue);
                cmd.Parameters.AddWithValue("@city_id", ddlcity.SelectedValue);
                cmd.Parameters.AddWithValue("@country_id", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@empid", ViewState["ID"]);
                cmd.ExecuteNonQuery();
                con.Close();
                btninsert.Text = "Submit";
                BindGrid();
            }
            txtname.Text = "";
            rblgender.ClearSelection();
            ddldesignation.SelectedValue = "0";
            txtsalary.Text = "";
            txtemail.Text = "";
            txtmobileno.Text = "";
            ddlqualification.SelectedValue = "0";
            ddlcountry.SelectedValue = "0";
            ddlcity.SelectedValue = "0";
            ddlcity.Enabled = false;

        }

        protected void gvwemployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="EDT")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empid", e.CommandArgument);
                cmd.Parameters.AddWithValue("@action", "EDIT");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddldesignation.SelectedValue = dt.Rows[0]["designation"].ToString();
                txtsalary.Text = dt.Rows[0]["salary"].ToString();
                txtemail.Text = dt.Rows[0]["email"].ToString();
                txtmobileno.Text = dt.Rows[0]["mobileno"].ToString();
                ddlqualification.SelectedValue = dt.Rows[0]["qualification"].ToString();
                ddlcountry.SelectedValue = dt.Rows[0]["country"].ToString();
                ddlcity.Visible = true;
                ddlcity.SelectedValue = dt.Rows[0]["city"].ToString();
                btninsert.Text = "Update";
                ViewState["ID"] = e.CommandArgument;

            }
            else if(e.CommandName=="DLT")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empid", e.CommandArgument);
                cmd.Parameters.AddWithValue("@action", "DELETE");
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcountry.SelectedValue == "0")
            {
                ddlcity.Enabled = false;
            }
            else
            {
                showcity();
            }
        }
    }
}