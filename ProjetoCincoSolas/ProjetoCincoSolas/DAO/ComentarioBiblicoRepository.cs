﻿using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SQLite;
using System.Configuration;

namespace ProjetoCincoSolas.DAO
{
    public class ComentarioBiblicoRepository
    {
        private readonly string _conStr = ConfigurationManager.ConnectionStrings["sqlLite"].ConnectionString;

        public IList<LivroBiblia> GetAllLivros()
        {
            var listaLivroBiblia = new List<LivroBiblia>();

            try
            {
                using (var conn = new SQLiteConnection(_conStr))
                {
                    const string sql = "Select Distinct NumeroLivroBiblia, LivroBiblia From LivroBiblia";

                    conn.Open();
                    var cmd = new SQLiteCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var livroBiblia = new LivroBiblia
                            {
                                NumeroLivro = reader["NumeroLivroBiblia"].ObjectToInt(),
                                Livro = reader["LivroBiblia"].ToString()
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

        public IList<int> GetAllCapitulosLivro(int numeroLivro)
        {
            var listaLivroBiblia = new List<int>();

            using (var conn = new SQLiteConnection(_conStr))
            {
                var sql = "Select Distinct Capitulo From Livrobiblia Where NumeroLivroBiblia = " + numeroLivro;

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
                    throw new Exception(e.Message);
                }
            }
        }

        public IList<ComentarioBiblico> GetAllComentarios(int idLivro, int idCapitulo)
        {
            var listaComentarioLivroBiblia = new List<ComentarioBiblico>();

            using (var conn = new SQLiteConnection(_conStr))
            {
                var sql = @"Select Distinct c.Id, c.Nome, clb.IdNumeroLivroBiblia From ComentarioLivroBiblia clb 
                            Join Comentario c on c.Id = clb.IdComentario 
                            Where IdNumeroLivroBiblia = " + idLivro + " And IdCapitulo = " + idCapitulo;
                try
                {
                    conn.Open();
                    var cmd = new SQLiteCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var comentarioLivroBiblia = new ComentarioBiblico
                            {
                                Comentario = new Comentario
                                {
                                    Id = reader["Id"].ObjectToInt(),
                                    Nome = reader["Nome"].ToString()
                                },
                                LivroBiblia = new LivroBiblia
                                {
                                    NumeroLivro = reader["IdNumeroLivroBiblia"].ObjectToInt()
                                }
                            };

                            listaComentarioLivroBiblia.Add(comentarioLivroBiblia);
                        }
                    }
                    return listaComentarioLivroBiblia;
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
        }

        public IList<ComentarioBiblico> GetAllComentarioLivroBiblia(int idComentario, int idNumeroLivroBiblia, int idCapitulo)
        {
            var listaComentarioLivroBiblia = new List<ComentarioBiblico>();

            using (var conn = new SQLiteConnection(_conStr))
            {
                var sql = @"Select IdComentario, Comentario From ComentarioLivroBiblia
                            Where IdComentario = " + idComentario +
                            " And IdNumeroLivroBiblia = " + idNumeroLivroBiblia + 
                            " And IdCapitulo = " + idCapitulo;
                try
                {
                    conn.Open();
                    var cmd = new SQLiteCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var comentarioLivroBiblia = new ComentarioBiblico
                            {
                                ComentarioLivroBiblia = reader["Comentario"].ToString(),
                                Comentario = new Comentario
                                {
                                    Id = reader["IdComentario"].ObjectToInt()
                                }
                            };

                            listaComentarioLivroBiblia.Add(comentarioLivroBiblia);
                        }
                    }
                    return listaComentarioLivroBiblia;
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
        }

    }
}