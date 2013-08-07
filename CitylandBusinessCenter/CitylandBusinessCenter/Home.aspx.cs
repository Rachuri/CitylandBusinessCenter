// ---------------------------------------------------------------
// <copyright Athor="Rachuri.Sreedhar" company="Cityland" file="Home.aspx.cs"  >
//   Cityland Booking
// </copyright>
// <summary>
//   Cityland Booking is online Room booking portal
// </summary>
// ---------------------------------------------------------------
namespace CitylandBusinessCenter
{
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;

    /// <summary>
    /// Home partial Class
    /// </summary>
    public partial class Home : System.Web.UI.Page
    {
        /// <summary>
        /// Page Load method
        /// </summary>
        /// <param name="sender"> page sender</param>
        /// <param name="e">page events</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.GetDataFromDb();
                this.GetDefaultCost();
            }
        }

        /// <summary>
        /// Check weather Rooms available or not 
        /// </summary>
        /// <param name="sender">button sender</param>
        /// <param name="e">object argument</param>
        protected void BtnCheckavalClick(object sender, EventArgs e)
        {
            this.lblCheckStatus.Visible = true;
            this.lblCheck.Visible = false;
            this.GetCheckRoom();
        }

        /// <summary>
        /// Dropdown Box Index Changed
        /// </summary>
        /// <param name="sender">Object Sender</param>
        /// <param name="e">Event arguments</param>
        protected void SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetDefaultCost();
            this.lblCheck.Visible = true;
            this.txtCheckIn.Text = string.Empty;
            this.txtCheckOut.Text = string.Empty;
            this.lblCheck.Text = "Please Check the Room is available or not ??....";
            this.lblCheck.ForeColor = Color.FromArgb(6, 10, 92);
            this.lblCheckStatus.Visible = false;
            
            
        }

        /// <summary>
        /// Get values  from database
        /// </summary>
        private void GetDataFromDb()
        {
            var conString = ConfigurationManager.ConnectionStrings["CitylandBooking"].ConnectionString;
            using (var con = new SqlConnection(conString))
            {
                const string CmdString = "Select * from CitylandBookingDb";
                var cmd = new SqlCommand(CmdString, con);
                con.Open();
                this.repRoomName.DataSource = cmd.ExecuteReader();
                this.repRoomName.DataBind();
                con.Close();
                con.Open();
                this.ddlRoomList.DataSource = cmd.ExecuteReader();
                this.ddlRoomList.DataBind();
                con.Close();
            }
        }

        /// <summary>
        /// Get Room Method
        /// </summary>
        private void GetCheckRoom()
        {
            var conString = ConfigurationManager.ConnectionStrings["CitylandBooking"].ConnectionString;
            using (var con = new SqlConnection(conString))
            {
                var cmd = new SqlCommand("CheckRoom", con) { CommandType = CommandType.StoredProcedure };
                var para1 = new SqlParameter("@RoomNamePARA", SqlDbType.VarChar) { Value = this.ddlRoomList.SelectedItem.ToString() };
                cmd.Parameters.Add(para1);
                con.Open();
                var returnvalue = (int)cmd.ExecuteScalar();
                if (returnvalue == -1)
                {
                    this.GetifCondition();
                }
                else
                {
                    this.GetelseCondition();
                }
            }
        }

        /// <summary>
        /// if condition
        /// </summary>
        private void GetifCondition()
        {
            this.lblCheckStatus.Text = "Room is available...Sir...! Could You Please book the room..." + this.ddlRoomList.SelectedItem;
            this.lblCheckStatus.ForeColor = Color.Green;
        }

        /// <summary>
        /// else condition
        /// </summary>
        private void GetelseCondition()
        {
            this.lblCheckStatus.Text = "Room is not available...Sir...! Could You Please book the room..." + this.ddlRoomList.SelectedItem;
            this.lblCheckStatus.ForeColor = Color.Red;
            
        }

 
        /// <summary>
        /// Get Cost
        /// </summary>
        private void GetDefaultCost()
        {
            var ddlString = this.ddlRoomList.SelectedValue.ToString();
            var costArray = ddlString.Split('.');
            var realmoney = costArray[0];
            this.lblCostPerDay.Text = realmoney + ".00" + "Rs/-";
        }
    }
 
}