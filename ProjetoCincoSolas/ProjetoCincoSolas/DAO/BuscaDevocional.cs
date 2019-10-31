using ProjetoCincoSolas.Helpers;
using System;
using System.Data.SqlClient;

namespace ProjetoCincoSolas.DAO
{
    public class BuscaDevocional : ConnectionHelper
    {
        public int GetDevocional(string data)
        {
            using (SqlConnection conn = new SqlConnection(GetConnection()))
            {
                try
                {
                    return 11731026;
                    //var cmd = new SqlCommand("select * from DevocionalJonhPiper where DataDevocional = @data", conn);
                    //cmd.Parameters.AddWithValue("@data", data);
                    //conn.Open();
                    //var reader = cmd.ExecuteReader();
                    //if (reader.Read()) return Convert.ToInt32(reader["Id"]);
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }

            }
            return 11731026;
        }
    }
}