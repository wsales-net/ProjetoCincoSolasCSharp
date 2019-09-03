using System.Collections.Generic;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Models
{
    public class ComentarioBiblicoViewModel
    {
        public int? IdTabelaCadastro { get; set; }
        public int? IdCampoTabelaCadastro { get; set; }
        public IEnumerable<SelectListItem> Tabelas { get; set; }
        public IEnumerable<SelectListItem> Campos { get; set; }
    }
}