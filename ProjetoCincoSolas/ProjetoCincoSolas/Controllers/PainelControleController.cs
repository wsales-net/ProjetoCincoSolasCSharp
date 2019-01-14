using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.Servico;
using System.Collections.Generic;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Controllers
{
    public class PainelControleController : Controller
    {
        private readonly DevsServico _devsServico;

        public PainelControleController()
        {
            _devsServico = new DevsServico();
        }

        public ActionResult Index()
        {
            return View();
        }

        public void SincronizarDados()
        {
            var listaPessoas = new List<Pessoa>();
            var i = 1;
            while (i <= 100)
            {
                var getPessoa = _devsServico.SincronizarPessoa();
                var pessoa = JsonHelper.ToEntity<Pessoa>(getPessoa);

                listaPessoas.Add(pessoa);
                i++;
            }
        }
    }
}