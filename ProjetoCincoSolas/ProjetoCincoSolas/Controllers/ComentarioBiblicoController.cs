using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.ViewModel;

namespace ProjetoCincoSolas.Controllers
{
    public class ComentarioBiblicoController : Controller
    {
        // GET: ComentarioBiblico
        public ActionResult Index()
        {
            var model = new ComentarioBiblicoViewModel();
            model.Livros = MontarComboLivros();

            return View(model);
        }

        public IEnumerable<SelectListItem> MontarComboLivros()
        {
            var lista = new List<ComentarioBiblico>();

            return lista.Select(x => new SelectListItem
            {
                Value = x.Id.ToString(),
                Text = x.Livro
            }).ToList();
        }

        // GET: ComentarioBiblico/ListarCapitulos/5
        public ActionResult ListarCapitulos(int idLivro)
        {
            var capitulos = new List<ComentarioBiblico>();

            return new JsonResult
            {
                Data = new
                {
                    capitulos,
                    Erro = false,
                    Mensagem = "",
                }
            };
        }


        // GET: ComentarioBiblico/ListarComentarios/5
        /// <summary>
        /// Retorna todos os camentários do banco de acordo com o livro e capítulo
        /// </summary>
        /// <param name="idLivro"></param>
        /// <param name="idCapitulo"></param>
        /// <returns>Retorna todos os camentários do banco de acordo com o livro e capítulo</returns>
        public ActionResult ListarComentarios(int idLivro, int idCapitulo)
        {
            var comentariosBiblicos = new List<ComentarioBiblico>();

            return new JsonResult
            {
                Data = new
                {
                    comentariosBiblicos,
                    Erro = false,
                    Mensagem = "",
                }
            };
        }


        // GET: ComentarioBiblico/ListarComentarios/5
        /// <summary>
        /// Retorna todos o camentário do banco de acordo com o livro e capítulo
        /// </summary>
        /// <returns></returns>
        public ActionResult ConsultarComentario(int idComentario)
        {
            var comentariosBiblicos = new List<ComentarioBiblico>();

            return new JsonResult
            {
                Data = new
                {
                    comentariosBiblicos,
                    Erro = false,
                    Mensagem = "",
                }
            };
        }
    }
}
