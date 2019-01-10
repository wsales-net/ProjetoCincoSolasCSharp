using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoCincoSolas.Helpers
{
    public class Retorno
    {
        public List<string> Mensagens { get; set; }

        public bool Erro => Mensagens != null && Mensagens.Count > 0;

        public void AddErro(string msg)
        {
            if (Mensagens == null)
            {
                Mensagens = new List<string>();
            }

            if (!Mensagens.Contains(msg))
            {
                Mensagens.Add(msg);
            }
        }
    }
}