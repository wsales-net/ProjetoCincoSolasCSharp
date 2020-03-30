using System.Web.Configuration;

namespace ProjetoCincoSolas.DAO
{
    public abstract class AbstractRepository
    {
        protected string conSomee { get; } = WebConfigurationManager.ConnectionStrings["somee"].ConnectionString;
        protected string conSqlLocal { get; } = WebConfigurationManager.ConnectionStrings["sqlLocal"].ConnectionString;
        protected string conSqlite { get; } = WebConfigurationManager.ConnectionStrings["sqlLite"].ConnectionString;
    }
}