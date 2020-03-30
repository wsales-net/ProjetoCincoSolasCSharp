using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Business
{
    public class AssuntoFraseNegocio : NegocioHelper<AssuntoFrase>
    {
        private readonly AssuntoFraseCristaRepository _assuntoFraseCristaRepository = new AssuntoFraseCristaRepository();

        /// <summary>
        /// Retona todos os autores das frases cristã inspiradas.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SelectListItem> MontarComboAssuntoFrase()
        {
            return MontarCombo(_assuntoFraseCristaRepository.GetAllAssuntoFraseCrista());
        }
    }
}