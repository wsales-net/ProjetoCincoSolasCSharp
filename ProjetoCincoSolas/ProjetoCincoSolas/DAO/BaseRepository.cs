using System.Configuration;
using System.Data;
using System.Data.SQLite;

namespace ProjetoCincoSolas.DAO
{
    public class BaseRepository : AbstractRepository
    {
        public bool VerificaConexao()
        {
            var con = new SQLiteConnection(SrtCon);
            con.Open();
            return con.State == ConnectionState.Open;
        }
    }
}