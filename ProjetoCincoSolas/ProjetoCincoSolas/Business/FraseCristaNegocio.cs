using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.Models;
using System.Collections.Generic;

namespace ProjetoCincoSolas.Business
{
    public class FraseCristaNegocio
    {
        private readonly FraseCristaRepository _fraseCristaRepository = new FraseCristaRepository();

        public IList<EntidadeCombo> GetAllAssuntoPorAutor(string idAutor)
        {
            return _fraseCristaRepository.GetAllAssuntoPorAutor(idAutor);
        }

        public IList<FraseCrista> GetAllFraseCrista(string textoFrase, string idAutor, string IdAssunto)
        {
            return _fraseCristaRepository.GetAllFraseCrista(textoFrase, idAutor, IdAssunto);
        }
    }
}