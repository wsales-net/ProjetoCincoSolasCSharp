using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using ProjetoCincoSolas.Business;
using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Helpers;
using ProjetoCincoSolas.Models;
using ProjetoCincoSolas.ViewModel;

namespace ProjetoCincoSolas.Controllers
{
    public class ComentarioBiblicoController : Controller
    {
        private readonly ComentarioBiblicoNegocio _comentarioBiblicoNegocio;
        private readonly BaseRepository baseRepository;

        public ComentarioBiblicoController()
        {
            _comentarioBiblicoNegocio = new ComentarioBiblicoNegocio(baseRepository);
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
            catch (Exception e)
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
        public JsonResult ListarComentarios(int idLivro, int idCapitulo)
        {
            var retorno = new Retorno();

            try
            {
                var comentarios = _comentarioBiblicoNegocio.GetAllComentarios(idLivro, idCapitulo);

                if (comentarios == null)
                {
                    comentarios = new List<ComentarioBiblico>();

                    for (var i = 0; i < 10; i++)
                    {
                        var comentarioLivroBiblia = new ComentarioBiblico
                        {
                            Comentario = new Comentario
                            {
                                Id = i,
                                Nome = "Comentario" + i
                            },
                            LivroBiblia = new LivroBiblia
                            {
                                NumeroLivro = i
                            }
                        };
                        comentarios.Add(comentarioLivroBiblia);
                    }

                    retorno.AddErro("Erro na requisição");
                }

                return new JsonResult
                {
                    Data = new
                    {
                        comentarios,
                        retorno
                    }
                };
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
                var comentariosBiblicos = _comentarioBiblicoNegocio.GetAllComentarioLivroBiblia(idComentario, idNumeroLivroBiblia, idCapitulo);

                if (comentariosBiblicos == null)
                {
                    retorno.AddErro("Erro na requisição");
                }

                return new JsonResult
                {
                    Data = new
                    {
                        comentariosBiblicos,
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
        /// Retorna o comentário do livro da Bíblia e o capítulo selecionado.
        /// </summary>
        /// <returns></returns>
        public ActionResult ConsultarPalavra(string palavra)
        {
            var retorno = new Retorno();
            try
            {
                var palavras = _comentarioBiblicoNegocio.GetAllPalavra(palavra);

                if (palavras == null)
                {
                    retorno.AddErro("Erro na requisição");
                }

                return new JsonResult
                {
                    Data = new
                    {
                        palavras,
                        retorno
                    },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
            catch (Exception e)
            {
                throw new HttpException(403, "Acesso Negado");
            }
        }

        /// <summary>
        /// Retorna o comentário do livro da Bíblia e o capítulo selecionado.
        /// </summary>
        /// <returns></returns>
        public ActionResult ConsultarSignificadoPalavra(string id)
        {
            var retorno = new Retorno();
            try
            {
                var palavra = _comentarioBiblicoNegocio.GetSignificadoPalavra(Convert.ToInt32(id));

                if (string.IsNullOrEmpty(palavra))
                {
                    retorno.AddErro("Erro na requisição");
                }

                return new JsonResult
                {
                    Data = new
                    {
                        palavra,
                        retorno
                    },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
            catch (Exception e)
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
