using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace ProjetoCincoSolas.Helpers
{

    public class ConnectionHelper : IConnectionHelper
    {
        //public static Usuario UsuarioLogado { get; private set; }
        public static string BaseDadosConectada { get; private set; }

        public static bool TestarConexao()
        {
            ConfigurationManager.RefreshSection("connectionStrings");
            var connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ConnectionString;

            return Conectar(connectionString, false);
        }

        public static bool TestarConexao(string connectionString)
        {
            var retorno = Conectar(connectionString, false);

            return retorno;
        }

        private static bool Conectar(string connectionString, bool criptografaString)
        {
            try
            {
                if (criptografaString)
                    connectionString = null;
                    //connectionString = CriptografiaHelper.DecodificarMD5(connectionString);

                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    BaseDadosConectada = connection.Database;
                    return true;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public string GetConnection()
        {
            return ConfigurationManager.ConnectionStrings["DatabaseConnection"].ConnectionString;
        }
    }
}