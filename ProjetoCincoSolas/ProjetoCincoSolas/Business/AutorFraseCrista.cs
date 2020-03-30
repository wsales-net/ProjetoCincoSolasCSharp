using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Business
{
    public class AutorFraseCristaNegocio : NegocioHelper<AutorFraseCrista>
    {
        private readonly AutorFraseCristaRepository _autorFraseCristaRepository = new AutorFraseCristaRepository();

        /// <summary>
        /// Retona todos os autores das frases cristã inspiradas.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SelectListItem> MontarComboAutorFrase()
        {
            return MontarCombo(_autorFraseCristaRepository.GetAllAutoresFraseCrista());
        }
    }
}