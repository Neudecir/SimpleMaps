using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Leaflet
{
    public partial class sair : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Login l = new Login();
            l.logado = false;
            Session.Abandon();
            Response.Redirect("/Home.aspx");
        }
    }
}
