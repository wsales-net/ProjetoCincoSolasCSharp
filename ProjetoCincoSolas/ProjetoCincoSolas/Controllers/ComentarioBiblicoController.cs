using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Controllers
{
    public class ComentarioBiblicoController : Controller
    {
        // GET: ComentarioBiblico
        public ActionResult Index()
        {
            return View();
        }

        // GET: ComentarioBiblico/ListarComentarios/5
        public ActionResult ListarComentariosCapitulo(int idCapitulo)
        {
            var campos = MontarComboCampo(idCapitulo);

            return new JsonResult
            {
                Data = new
                {
                    campos = campos,
                    idCampo = campos.First(),
                    Erro = false,
                    Mensagem = "",
                }
            };
        }


        public IList<SelectListItem> MontarComboCampo(int idTabelaCadastro)
        {
            //IList<Classe>
            //var campos = new IList<obj>(); _campoTabelaCadastroRepository.BuscarCamposPorTabela(idTabelaCadastro);

            //return campos.Select(x => new SelectListItem
            //{
            //    Value = x.Id.ToString(),
            //    Text = x.Descricao
            //}).ToList();
            return new List<SelectListItem>();
        }
    }
}
