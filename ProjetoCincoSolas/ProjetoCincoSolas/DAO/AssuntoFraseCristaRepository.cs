using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;

namespace ProjetoCincoSolas.DAO
{
    public class AssuntoFraseCristaRepository : BaseRepository
    {
        public IList<EntidadeCombo> GetAllAssuntoFraseCrista()
        {
            var listaAutorFraseCrista = new List<EntidadeCombo>();

            try
            {
                using (var conn = new SqlConnection(conSqlLocal))
                {
                    const string sql = "Select Id, Assunto from AssuntoFrase Order By Id";

                    conn.Open();
                    var cmd = new SqlCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var livroBiblia = new EntidadeCombo
                            {
                                Id = reader["Id"].ObjectToInt(),
                                Value = reader["Assunto"].ToString()
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