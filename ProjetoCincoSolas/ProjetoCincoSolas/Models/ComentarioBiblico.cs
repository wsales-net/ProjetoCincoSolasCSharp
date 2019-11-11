namespace ProjetoCincoSolas.Models
{
    public class ComentarioBiblico : Entidade
    {
        public Comentario Comentario { get; set; }
        public LivroBiblia LivroBiblia { get; set; }
        public string ComentarioLivroBiblia { get; set; }
    }
}