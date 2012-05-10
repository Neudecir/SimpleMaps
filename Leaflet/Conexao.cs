using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MySql.Data.MySqlClient;

namespace Leaflet
{
    public class Conexao
    {
        public static MySqlConnection criarConexao()
        {
            return new MySqlConnection("Server=187.45.196.236;Database=genialsystems;Uid=genialsystems;Pwd=a1b2c3;");
        }

    }
}
