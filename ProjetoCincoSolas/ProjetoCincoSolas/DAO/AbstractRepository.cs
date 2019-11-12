using System.Configuration;
using System.Web.Configuration;

namespace ProjetoCincoSolas.DAO
{
    public class AbstractRepository
    {
        protected string StringConnection { get; } = WebConfigurationManager.ConnectionStrings["SqlLite"].ConnectionString;
        protected string SrtCon { get; } = ConfigurationManager.ConnectionStrings["sqlLite"].ConnectionString;
    }
}