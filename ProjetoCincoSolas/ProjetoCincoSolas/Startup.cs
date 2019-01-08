using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProjetoCincoSolas.Startup))]
namespace ProjetoCincoSolas
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
