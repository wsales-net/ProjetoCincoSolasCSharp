using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SQLite;
using System.Configuration;

namespace ProjetoCincoSolas.DAO
{
    public class ComentarioBiblicoRepository
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["sqlLite"].ConnectionString;

        public IList<LivroBiblia> GetAllLivros()
        {
            List<LivroBiblia> listaLivroBiblia = new List<LivroBiblia>();

            using (var conn = new SQLiteConnection(conStr))
            {
                string sql = "Select Distinct NumeroLivroBiblia, LivroBiblia From LivroBiblia";

                try
                {
                    conn.Open();
                    var cmd = new SQLiteCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var livroBiblia = new LivroBiblia();

                            livroBiblia.NumeroLivro = reader["NumeroLivroBiblia"].ObjectToInt();
                            livroBiblia.Livro = reader["LivroBiblia"].ToString();
                            listaLivroBiblia.Add(livroBiblia);
                        }
                    }
                    return listaLivroBiblia;
                }
                catch (Exception e)
                {
                    throw e;
                }
            }
        }

        /*
         select distinct idcomentario, nome from ComentarioLivroBiblia clb
         join Comentario c on c.id = clb.idcomentario
         where idnumerolivrobiblia = 48 and idcapitulo = 2

        select comentario from ComentarioLivroBiblia
        where idcomentario = 4 
        and idnumerolivrobiblia = 48 
        and idcapitulo = 2

        */


        public IList<int> GetAllCapitulosLivro(int numeroLivro)
        {
            List<int> listaLivroBiblia = new List<int>();

            using (var conn = new SQLiteConnection(conStr))
            {
                string sql = "Select Distinct Capitulo From Livrobiblia Where NumeroLivroBiblia = " + numeroLivro;

                try
                {
                    conn.Open();
                    var cmd = new SQLiteCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            listaLivroBiblia.Add(reader["Capitulo"].ObjectToInt());
                        }
                    }
                    return listaLivroBiblia;
                }
                catch (Exception e)
                {
                    throw e;
                }
            }
        }

    }
}