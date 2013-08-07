using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace CitylandBusinessCenter
{
    public partial class QuesAns : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.GetDataFromDb();
                
            }
        }

        /// <summary>
        /// Get values  from database
        /// </summary>
        private void GetDataFromDb()
        {
            var conString = ConfigurationManager.ConnectionStrings["CitylandBooking"].ConnectionString;
            using (var con = new SqlConnection(conString))
            {
                const string CmdString = "Select * from QuesAndAns";
                var cmd = new SqlCommand(CmdString, con);
                con.Open();
                this.repQuesAndAns.DataSource = cmd.ExecuteReader();
                this.repQuesAndAns.DataBind();
                con.Close();
               
            }
        }
    }
}