using ProjetoCincoSolas.DAO;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Business
{
    public class TagFraseBiblicaNegocio
    {
        private readonly TagFraseBiblicaRepository _tagFraseBiblicaRepository;

        public TagFraseBiblicaNegocio()
        {
            _tagFraseBiblicaRepository = new TagFraseBiblicaRepository();
        }

        /// <summary>
        /// Retona todos as tags das frases.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SelectListItem> MontarComboTagsFrases()
        {
            var tagsFrase = _tagFraseBiblicaRepository.GetAllTagsFrase();

            return tagsFrase.Select(x => new SelectListItem
            {
                Value = x.Id.ToString(),
                Text = x.Tag
            }).ToList();
        }
    }
}