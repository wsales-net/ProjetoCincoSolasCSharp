using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ProjetoCincoSolas.DAO
{
    public class FraseCristaRepository : BaseRepository
    {

        public IList<EntidadeCombo> GetAllAssuntoPorAutor(string idAutor)
        {
            var listaLivroBiblia = new List<EntidadeCombo>();

            using (var conn = new SqlConnection(conSqlLocal))
            {
                var sql = $@"Select Distinct assunto.Id IdAssunto, Assunto From FraseCrista fc
                            Join AutorFraseCrista autor on autor.Id = fc.IdAutorFraseCrista
                            Join AssuntoFrase assunto on assunto.Id = fc.IdAssuntoFrase
                            Where ({(string.IsNullOrEmpty(idAutor) ? "null" : idAutor)} Is Null Or
                            IdAutorFraseCrista = {(string.IsNullOrEmpty(idAutor) ? "null " : idAutor)})";
                try
                {
                    conn.Open();
                    var cmd = new SqlCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var assuntosAutor = new EntidadeCombo
                            {
                                Id = reader["IdAssunto"].ObjectToInt(),
                                Value = reader["Assunto"].ToString()
                            };

                            listaLivroBiblia.Add(assuntosAutor);
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

        public IList<FraseCrista> GetAllFraseCrista(string textoFrase, string idAutor, string IdAssunto)
        {

            var frasesCristas = new List<FraseCrista>();

            using (var conn = new SqlConnection(conSqlLocal))
            {
                var sql = $@"select Frase, autor.Nome Autor from FraseCrista f
                            join AutorFraseCrista autor on autor.Id = f.IdAutorFraseCrista
                            join AssuntoFrase assunto on assunto.Id = f.IdAssuntoFrase
                            Where ({(string.IsNullOrEmpty(idAutor) ? "null" : idAutor)} Is Null Or IdAutorFraseCrista = {(string.IsNullOrEmpty(idAutor) ? "null " : idAutor)}) 
                              And ({(string.IsNullOrEmpty(IdAssunto) ? "null" : IdAssunto)} Is Null Or IdAssuntoFrase = {(string.IsNullOrEmpty(IdAssunto) ? "null " : IdAssunto)}) 
                              And Frase like '%{textoFrase}%'";

                try
                {
                    conn.Open();
                    var cmd = new SqlCommand(sql, conn);
                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var autor = new AutorFraseCrista
                            {
                                Nome = reader["Autor"].ToString()
                            };

                            var frase = new FraseCrista()
                            {
                                Frase = reader["Frase"].ToString(),
                                AutorFraseCrista = autor
                            };

                            frasesCristas.Add(frase);
                        }
                    }
                    return frasesCristas;
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
        }
    }
}