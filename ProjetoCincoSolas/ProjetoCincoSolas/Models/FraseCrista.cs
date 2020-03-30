namespace ProjetoCincoSolas.Models
{
    public class FraseCrista : Entidade
    {
        public int IdAssuntoFrase { get; set; }
        public int IdAutorFraseCrista { get; set; }
        public int IdFonteFraseCrista { get; set; }

        public AutorFraseCrista AutorFraseCrista { get; set; }
        public string Frase { get; set; }
        public string Titulo { get; set; }
    }
}