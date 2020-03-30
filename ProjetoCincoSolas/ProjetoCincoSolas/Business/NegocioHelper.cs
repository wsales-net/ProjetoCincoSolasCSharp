using ProjetoCincoSolas.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Business
{
    public class NegocioHelper<T> where T : class
    {
        public IEnumerable<SelectListItem> MontarCombo(IList<EntidadeCombo> entidade)
        {
            return entidade.Select(x => new SelectListItem
            {
                Value = x.Id.ToString(),
                Text = x.Value
            }).ToList();
        }
    }
}