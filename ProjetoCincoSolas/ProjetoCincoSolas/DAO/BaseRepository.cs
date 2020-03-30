
namespace ProjetoCincoSolas.DAO
{
    public class BaseRepository : AbstractRepository
    {
        //public BaseRepository(BaseRepository _baseRepository)
        //{
        //}

        public bool VerificaConexaoSqlite()
        {
            //var con = new SQLiteConnection(conSqlite);
            //con.Open();
            //return con.State == ConnectionState.Open;
            return true;
        }
    }
}