using System.Collections.Generic;
using System.Web.Mvc;

namespace ProjetoCincoSolas.ViewModel
{
    public class AutorFraseViewModel
    {
        public int? IdAutorFrase { get; set; }
        public IEnumerable<SelectListItem> AutoresFrase { get; set; }
    }
}