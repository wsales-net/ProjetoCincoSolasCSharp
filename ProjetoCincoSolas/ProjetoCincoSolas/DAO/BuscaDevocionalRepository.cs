using ProjetoCincoSolas.Helpers;
using System;
using System.Data.SqlClient;

namespace ProjetoCincoSolas.DAO
{
    public class BuscaDevocionalRepository : ConnectionHelper
    {
        public int GetDevocional(string data)
        {
            using (SqlConnection conn = new SqlConnection(GetConnection()))
            {
                try
                {
                    var cmd = new SqlCommand("select * from DevocionalDiario where DataDevocional = @data", conn);
                    cmd.Parameters.AddWithValue("@data", data);
                    conn.Open();
                    var reader = cmd.ExecuteReader();
                    if (reader.Read()) return Convert.ToInt32(reader["Id"]);
                }
                catch (Exception ex)
                {
                    return 10111260;

                    throw new Exception(ex.Message);
                }
                return 10111260;
            }
        }
    }
}