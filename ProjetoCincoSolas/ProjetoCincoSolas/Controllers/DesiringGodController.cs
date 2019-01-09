using ProjetoCincoSolas.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Controllers
{
    public class DesiringGodController : Controller
    {
        private readonly BuscaDevocional _buscaDevocional = new BuscaDevocional();

        // GET: DesiringGod
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetCodigoDevocional()
        {
            //var day = DateTime.Now.AddDays(1).Day;
            //var ano = DateTime.Now.AddYears(1).Year;

            var date = DateTime.Now.Day + "-de-" + GetMonth(DateTime.Now.Month);

            //Verificar dado retornar
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