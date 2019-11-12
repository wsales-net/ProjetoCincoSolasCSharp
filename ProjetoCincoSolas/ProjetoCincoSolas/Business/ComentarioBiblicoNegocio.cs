using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Models;

namespace ProjetoCincoSolas.Business
{
    public class ComentarioBiblicoNegocio
    {
        private readonly ComentarioBiblicoRepository _comentarioBiblicoRepository;
        private readonly BaseRepository _baseRepository;

        public ComentarioBiblicoNegocio(BaseRepository baseRepository)
        {
            _baseRepository = baseRepository;
            _comentarioBiblicoRepository = new ComentarioBiblicoRepository();
        }

        public IList<LivroBiblia> GetAllLivros()
        {
            return _comentarioBiblicoRepository.GetAllLivros();
        }

        public IList<int> GetAllCapitulosLivro(int idLivro)
        {
            return _comentarioBiblicoRepository.GetAllCapitulosLivro(idLivro);
        }

        public IList<ComentarioBiblico> GetAllComentarios(int idLivro, int idCapitulo)
        {
            return _comentarioBiblicoRepository.GetAllComentarios(idLivro, idCapitulo);
        }

        public IList<Comentario> GetAllComentarioLivroBiblia(int idComentario, int idNumeroLivroBiblia, int idCapitulo)
        {
            return _comentarioBiblicoRepository.GetAllComentarioLivroBiblia(idComentario, idNumeroLivroBiblia, idCapitulo);
        }

        /// <summary>
        /// Retona lista de livros.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SelectListItem> MontarComboLivros()
        {
            var livros = _comentarioBiblicoRepository.GetAllLivros();

            return livros.Select(x => new SelectListItem
            {
                Value = x.NumeroLivro.ToString(),
                Text = x.Livro
            }).ToList();
        }
    }
}