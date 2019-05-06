using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.Servico;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

        // GET: PainelControle
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult SincronizarDados()
        {
            var listaPessoas = new List<PessoaImportadaDto>();
            var i = 1;
            while (i <= 10)
            {
                var getPessoa = _devsServico.SincronizarPessoa();
                var pessoaImportadaDto = JsonHelper.ToEntity<PessoaImportadaDto>(getPessoa);

                listaPessoas.Add(pessoaImportadaDto);
                i++;
            }

            return Json("Dados de pessoas sincronizados com sucesso!", JsonRequestBehavior.AllowGet);
        }
    }
}