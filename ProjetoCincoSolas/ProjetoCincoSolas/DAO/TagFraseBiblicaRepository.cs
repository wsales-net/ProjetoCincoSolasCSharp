using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ProjetoCincoSolas.DAO
{
    public class TagFraseBiblicaRepository : BaseRepository
    {
        public IList<TagFraseBiblica> GetAllTagsFrase()
        {
            var listaLivroBiblia = new List<TagFraseBiblica>();

            try
            {
                using (var conn = new SqlConnection(conSqlLocal))
                {
                    const string sql = "Select * From TagFrase";

                    conn.Open();
                    var cmd = new SqlCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var livroBiblia = new TagFraseBiblica
                            {
                                Id = reader["Id"].ObjectToInt(),
                                Tag = reader["Tag"].ToString()
                            };

                            listaLivroBiblia.Add(livroBiblia);
                        }
                    }
                    return listaLivroBiblia;
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}