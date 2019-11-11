namespace ProjetoCincoSolas.Models
{
    public class LivroBiblia : Entidade
    {
        public int NumeroLivro { get; set; }
        public int Capitulo { get; set; }
        public int Versiculo { get; set; }
        public string Livro { get; set; }
        public string Abreviacao { get; set; }
    }
}