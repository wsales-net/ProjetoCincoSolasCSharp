using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.ViewModel;

namespace ProjetoCincoSolas.Controllers
{
    public class ComentarioBiblicoController : Controller
    {
        private readonly ComentarioBiblicoRepository _comentarioBiblico;

        public ComentarioBiblicoController()
        {
            _comentarioBiblico = new ComentarioBiblicoRepository();
        }

        // GET: ComentarioBiblico
        public ActionResult Index()
        {
            var model = new ComentarioBiblicoViewModel();
            model.Livros = MontarComboLivros();
            model.Capitulos = new List<SelectListItem>();

            return View(model);
        }

        // GET: ComentarioBiblico
        public ActionResult Perolas()
        {
            return View();
        }

        public IEnumerable<SelectListItem> MontarComboLivros()
        {
            var livros = _comentarioBiblico.GetAllLivros();

            return livros.Select(x => new SelectListItem
            {
                Value = x.NumeroLivro.ToString(),
                Text = x.Livro
            }).ToList();
        }

        // GET: ComentarioBiblico/ListarCapitulos/5
        public ActionResult ListarCapitulos(int idLivro)
        {
            var retorno = new Retorno();
            var capitulos = _comentarioBiblico.GetAllCapitulosLivro(idLivro);

            if (capitulos == null)
            {
                retorno.AddErro("Erro na requisição");
                retorno.AddErro("Erro");
            }

            return new JsonResult
            {
                Data = new
                {
                    capitulos,
                    retorno
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
        //public ActionResult ListarComentarios(ComentarioBiblicoViewModel comentarioBiblicoViewModel)
        //{
        //    var comentariosBiblicos = new List<ComentarioBiblico>();

        //    return new JsonResult
        //    {
        //        Data = new
        //        {
        //            comentariosBiblicos,
        //            Erro = false,
        //            Mensagem = "",
        //        }
        //    };
        //}

        public ActionResult ListarComentarios(int IdLivro, int IdCapitulo)
        {
            var retorno = new Retorno();
            var capitulos = _comentarioBiblico.GetAllCapitulosLivro(IdLivro);

            if (capitulos == null)
            {
                retorno.AddErro("Erro na requisição");
                retorno.AddErro("Erro");
            }

            return new JsonResult
            {
                Data = new
                {
                    capitulos,
                    retorno
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
