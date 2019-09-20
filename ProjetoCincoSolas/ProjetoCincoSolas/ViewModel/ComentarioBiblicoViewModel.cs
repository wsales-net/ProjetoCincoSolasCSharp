using System.Collections.Generic;
using System.Web.Mvc;

namespace ProjetoCincoSolas.ViewModel
{
    public class ComentarioBiblicoViewModel
    {
        public int? IdLivro { get; set; }
        public int? IdCapitulo { get; set; }
        public int? IdVersiculo { get; set; }
        public IEnumerable<SelectListItem> Livros { get; set; }
        public IEnumerable<SelectListItem> Capitulos { get; set; }
        public IEnumerable<SelectListItem> Versiculos { get; set; }
    }
}