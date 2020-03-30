using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Models;

namespace ProjetoCincoSolas.Business
{
    public class ComentarioBiblicoNegocio
    {
        private readonly ComentarioBiblicoRepository _comentarioBiblicoRepository = new ComentarioBiblicoRepository();

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

        public IList<ComentarioBiblico> GetAllComentarioLivroBiblia(int idComentario, int idNumeroLivroBiblia, int idCapitulo)
        {
            return _comentarioBiblicoRepository.GetAllComentarioLivroBiblia(idComentario, idNumeroLivroBiblia, idCapitulo);
        }

        public IList<Dicionario> GetAllPalavra(string palavra)
        {
            return _comentarioBiblicoRepository.GetAllPalavra(palavra);
        }

        public IEnumerable<SelectListItem> MontarComboLivros()
        {
            var livros = _comentarioBiblicoRepository.GetAllLivros();

            return livros.Select(x => new SelectListItem
            {
                Value = x.NumeroLivro.ToString(),
                Text = x.Livro
            }).ToList();
        }

        public string GetSignificadoPalavra(int id)
        {
            return _comentarioBiblicoRepository.GetSignificadoPalavra(id);
        }
    }
}