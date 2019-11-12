using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using ProjetoCincoSolas.Business;
using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.ViewModel;

namespace ProjetoCincoSolas.Controllers
{
    public class ComentarioBiblicoController : Controller
    {
        private readonly ComentarioBiblicoNegocio _comentarioBiblicoNegocio;

        public ComentarioBiblicoController()
        {
            _comentarioBiblicoNegocio = new ComentarioBiblicoNegocio();
        }

        /// <summary>
        /// Carrega a página com os livros da Bíblia.
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            try
            {
                var model = new ComentarioBiblicoViewModel
                {
                    Livros = _comentarioBiblicoNegocio.MontarComboLivros(),
                    Capitulos = new List<SelectListItem>()
                };

                return View(model);
            }
            catch (Exception)
            {
                throw new HttpException(403, "Acesso Negado");
            }
        }


        /// <summary>
        /// Retorna lista de capítulos do livro selecionado da bíblia.
        /// </summary>
        /// <param name="idLivro"></param>
        /// <returns></returns>
        public JsonResult ListarCapitulos(int idLivro)
        {
            var retorno = new Retorno();

            try
            {
                var capitulos = _comentarioBiblicoNegocio.GetAllCapitulosLivro(idLivro);

                if (capitulos == null)
                {
                    retorno.AddErro("Erro na requisição");
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
            catch (Exception)
            {
                throw new HttpException(403, "Acesso Negado");
            }
        }

        /// <summary>
        /// Retorna lista de comentários da Bíblia.
        /// </summary>
        /// <param name="idLivro"></param>
        /// <param name="idCapitulo"></param>
        /// <returns></returns>
        [HttpGet]
        public JsonResult ListarComentarios(int idLivro, int idCapitulo)
        {
            var retorno = new Retorno();

            try
            {
                var comentarios = _comentarioBiblicoNegocio.GetAllComentarios(idLivro, idCapitulo);

                if (comentarios == null)
                {
                    retorno.AddErro("Erro na requisição");
                }

                return Json(new JsonResult
                {
                    Data = new
                    {
                        comentarios,
                        retorno
                    },
                }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception)
            {
                throw new HttpException(403, "Acesso Negado");
            }
        }

        // GET: ComentarioBiblico/ListarComentarios/5
        /// <summary>
        /// Retorna o comentário do livro da Bíblia e o capítulo selecionado.
        /// </summary>
        /// <returns></returns>
        public ActionResult ConsultarComentario(int idComentario, int idNumeroLivroBiblia, int idCapitulo)
        {
            var retorno = new Retorno();
            try
            {
                var comentarioLivroBiblia = _comentarioBiblicoNegocio.GetAllComentarioLivroBiblia(idComentario, idNumeroLivroBiblia, idCapitulo);

                if (comentarioLivroBiblia == null)
                {
                    retorno.AddErro("Erro na requisição");
                }

                return new JsonResult
                {
                    Data = new
                    {
                        comentariosBiblicos = comentarioLivroBiblia,
                        retorno
                    }
                };
            }
            catch (Exception)
            {
                throw new HttpException(403, "Acesso Negado");
            }
        }



        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Perolas()
        {
            return View();
        }
    }
}
