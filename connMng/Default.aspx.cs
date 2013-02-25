using System;
using System.Collections.Generic;
using System.Linq;
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
    }
}