using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml;
using Newtonsoft.Json;
using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using Formatting = Newtonsoft.Json.Formatting;

namespace ProjetoCincoSolas.DAO
{
    public class BuscaDevocional
    {
        string connetionString = @"Data Source=.\SQLExpress;Initial Catalog=ProjetoCincoSolas; User ID=sa; Password=conectar";

        public int GetDevocional(string data)
        {
            using (SqlConnection conn = new SqlConnection(connetionString))
            {
                try
                {
                    //var xml = new XmlDocument();
                    //xml.Load($@"..\..\Shared\Integracao\ImportacaoTaxas\{""}");
                    //var jsonTaxas = JsonConvert.SerializeXmlNode(xml, Formatting.None, true);
                    //var taxas = JsonHelper.ToEntity<Pessoa> (jsonTaxas);

                    var cmd = new SqlCommand("select * from DevocionalJonhPiper where DataDevocional = @data", conn);
                    cmd.Parameters.AddWithValue("@data", data);
                    //cmd.Parameters.Add(new SqlParameter("@data", data));
                    conn.Open();
                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                        return Convert.ToInt32(reader["Id"]);
                }
                catch (Exception ex) //BAD BAD BAD!!! Why are you doing this!
                {
                    throw new Exception(ex.Message);
                }

            }
            return 0;
        }
        public void conexao()
        {
            string connetionString = "Data Source=./SQLExpress;Initial Catalog=ProjetoCincoSolas; User ID=sa; Password=conectar";
            SqlConnection cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                cnn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}