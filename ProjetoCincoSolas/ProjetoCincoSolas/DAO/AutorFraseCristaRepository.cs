using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ProjetoCincoSolas.DAO
{
    public class AutorFraseCristaRepository : BaseRepository
    {
        public IList<EntidadeCombo> GetAllAutoresFraseCrista()
        {
            var listaAutorFraseCrista = new List<EntidadeCombo>();

            try
            {
                using (var conn = new SqlConnection(conSqlLocal))
                {
                    const string sql = "Select Id, Nome from AutorFraseCrista Order By Id";

                    conn.Open();
                    var cmd = new SqlCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var livroBiblia = new EntidadeCombo
                            {
                                Id = reader["Id"].ObjectToInt(),
                                Value = reader["Nome"].ToString()
                            };

                            listaAutorFraseCrista.Add(livroBiblia);
                        }
                    }
                    return listaAutorFraseCrista;
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}