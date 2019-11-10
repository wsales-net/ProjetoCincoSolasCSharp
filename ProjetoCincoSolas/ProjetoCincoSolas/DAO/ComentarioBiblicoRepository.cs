using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SQLite;

namespace ProjetoCincoSolas.DAO
{
    public class ComentarioBiblicoRepository
    {
        public IList<LivroBiblia> GetAllLivros()
        {
            List<LivroBiblia> listaLivroBiblia = new List<LivroBiblia>();

            string strConn = "Data Source=C:\\ComentarioBiblia.db";

            using (var conn = new SQLiteConnection(strConn))
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

        public IList<int> GetAllCapitulosLivro(int numeroLivro)
        {
            List<int> listaLivroBiblia = new List<int>();

            string strConn = "Data Source=C:\\ComentarioBiblia.db";

            using (var conn = new SQLiteConnection(strConn))
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

        public void exibirDados()
        {
            SqlConnection conexao = new SqlConnection("connString");
            SqlCommand comando = new SqlCommand("SELECT * FROM TABELA", conexao);
            SqlDataReader dr = null;

            try
            {
                conexao.Open();
                dr = comando.ExecuteReader(CommandBehavior.CloseConnection);
                while (dr.Read())
                {
                    Console.WriteLine(dr.GetString(1));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Erro.");
            }
            finally
            {
                dr.Close();
            }
        }
    }
}