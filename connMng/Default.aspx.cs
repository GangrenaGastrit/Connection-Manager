using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using DevExpress.Web.ASPxCallback;
using DevExpress.Web.ASPxClasses;
using Microsoft.SqlServer.Management.Smo;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace connMng
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            pcConnectionManager.Height = ASPxPanel1.Visible ? 270 : 220;
        }

        protected void ShowDialogOnClick(object sender, EventArgs e)
        {
            pcConnectionManager.ShowOnPageLoad = true;
        }

        protected void AuthTypeOnSelectedIndexChanged(object sender, EventArgs e)
        {
            ASPxPanel1.Visible = Convert.ToInt32(rblAuthType.SelectedItem.Value) != 0;
        }

        private void ConnectionTest()
        {
            var srvName = cbServerList.ClientValue;

            if (srvName != string.Empty)
            {
                string strSecurity = (rblAuthType.SelectedIndex == 0) ? "Integrated Security=SSPI" :
                    String.Format("Integrated Security=false;User ID={0};Password={1}", tbLogin.Text, tbPassword.Text);

                string connectionString = String.Format("Data Source={0};{1};Persist Security Info=True;", srvName, strSecurity);

                Boolean connected;
                using (var connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        connected = (connection.State == ConnectionState.Open);
                    }
                    catch (Exception)
                    {
                        connected = false;
                    }
                }

                DialogText.Text = (!connected)
                                      ? "Не удалось соединиться с сервером."
                                      : "Соединение с сервером установлено.";
                ASPxPopupControl1.ShowOnPageLoad = true;
            }
            else
            {
                DialogText.Text = "Не указано имя сервера.";
                ASPxPopupControl1.ShowOnPageLoad = true;
            }
        }

        protected void FindServerOnClick(object sender, EventArgs e)
        {
            var run = new Thread(GetServerList);
        }

        private void GetServerList()
        {

            var dtServerList = SmoApplication.EnumAvailableSqlServers(false);

            if (dtServerList.Rows.Count > 0)
            {
                var dv = dtServerList.DefaultView;
                dv.Sort = "Name";
                dtServerList = dv.ToTable();

                cbServerList.Items.Clear();

                foreach (DataRow row in dtServerList.Rows)
                {
                    cbServerList.Items.Add(Convert.ToString(row["Name"]));
                }

                cbServerList.SelectedIndex = 0;
            }
        }

        protected void ASPxCallback1OnCallback(object source, CallbackEventArgs e)
        {
            //GetServerList();
           
        }

        protected void ConnectOnClick(object sender, EventArgs e)
        {
            ConnectionTest();
        }
    }
}