using Newtonsoft.Json;
using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.Servico;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Controllers
{
    public class DevocionalDiarioController : Controller
    {
        private readonly BuscaDevocional _buscaDevocional;

        public DevocionalDiarioController()
        {
            _buscaDevocional = new BuscaDevocional();
        }

        // GET: DesiringGod
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetCodigoDevocional()
        {
            var date = DateTime.Now.Day + "-de-" + GetMonth(DateTime.Now.Month);

            var codeEpisodio = _buscaDevocional.GetDevocional(date);

            return Json(codeEpisodio, JsonRequestBehavior.AllowGet);
        }

        private string GetMonth(int mes)
        {
            switch (mes)
            {
                case 1:
                    return "Janeiro";
                case 2:
                    return "Fevereiro";
                case 3:
                    return "Março";
                case 4:
                    return "Abril";
                case 5:
                    return "Maio";
                case 6:
                    return "Junho";
                case 7:
                    return "Julho";
                case 8:
                    return "Agosto";
                case 9:
                    return "Setembro";
                case 10:
                    return "Outubro";
                case 11:
                    return "Novembro";
                default:
                    return "Dezembro";
            }
        }
    }
}