using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoCincoSolas.Models
{
    public class Dicionario : Entidade
    {
        public string Palavra { get; set; }
        public string Significado { get; set; }
        public string LivroDicionario { get; set; }
    }
}