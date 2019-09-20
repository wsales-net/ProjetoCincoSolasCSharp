namespace ProjetoCincoSolas.Models
{
    public class ComentarioBiblico
    {
        public int Id { get; set; }
        public int NumeroLivro { get; set; }
        public string Livro { get; set; }
        public string Abreviatura { get; set; }
        public int Capitulo { get; set; }
        public int Versiculo { get; set; }
    }
}