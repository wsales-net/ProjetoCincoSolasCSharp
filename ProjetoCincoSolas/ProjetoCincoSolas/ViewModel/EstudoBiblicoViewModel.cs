using System.Collections.Generic;
using System.Web.Mvc;

namespace ProjetoCincoSolas.ViewModel
{
    public class EstudoBiblicoViewModel
    {
        public int? IdLivro { get; set; }
        public int? IdCapitulo { get; set; }
        public int? IdVersiculo { get; set; }
        public int? IdAssunto { get; set; }
        public int? IdAutor { get; set; }
        public IEnumerable<SelectListItem> Livros { get; set; }
        public IEnumerable<SelectListItem> Capitulos { get; set; }
        public IEnumerable<SelectListItem> Versiculos { get; set; }
        public IEnumerable<SelectListItem> Assuntos { get; set; }
        public IEnumerable<SelectListItem> Autores { get; set; }
    }
}