using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace ProjetoCincoSolas.Servico
{
    public class DevsServico
    {
        public string SincronizarPessoa()
        {
            var url = "https://www.4devs.com.br/ferramentas_online.php";
            var request = (HttpWebRequest)WebRequest.Create(url);

            var postData = "acao=gerar_pessoa";
            postData += "&sexo=H";
            postData += "&idade=22";
            postData += "&pontuacao=N";

            var data = Encoding.UTF8.GetBytes(postData);

            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = data.Length;

            using (var stream = request.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }

            var response = (HttpWebResponse)request.GetResponse();
            var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
            return responseString;
        }
    }
}