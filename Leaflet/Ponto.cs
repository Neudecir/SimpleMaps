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

namespace Leaflet
{
    public class Ponto
    {
        public int id_ponto;
        public string nome;
        public string latitude;
        public string longitude;
        public string texto;
        public int id_tipo_mapa;
    }
}
