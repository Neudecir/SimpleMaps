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
    public class login
    {
        public bool validaLogin(string email, string senha)
        {
            bool encontrou = false;
            MySqlConnection conn = Conexao.criarConexao();
           
            try
            {
                conn.Open();

                MySqlCommand commandReader = new MySqlCommand(
                    "SELECT email, senha FROM usuario WHERE email = \'" + email + "\' AND senha = \'"+ senha +"\'", conn);
                MySqlDataReader reader = commandReader.ExecuteReader();
                if (reader.HasRows == true)
                {
                    encontrou = true;
                }
            }
            catch (Exception ex)
            {
                string erro = ex.Message;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return encontrou;
        }

    }
}
