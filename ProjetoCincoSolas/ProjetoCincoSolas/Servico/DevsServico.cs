using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using ProjetoCincoSolas.Models;

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

        public void GravarQuery(PessoaImportadaDto pessoaImportadaDto)
        {
            Random random = new Random();
            var cidade = random.Next(1, 5610);

            var query = "IF NOT EXISTS (SELECT * FROM Endereco WHERE Cep = '" + pessoaImportadaDto.Cep + "') " +
                        "INSERT INTO Endereco (IdCidade, Cep, Logradouro, Bairro, Numero, Complemento)" +
                        "VALUES (" + cidade + ", " + pessoaImportadaDto.Cep + ", " + pessoaImportadaDto.Endereco + ", " + pessoaImportadaDto.Bairro + ", " + 
                        ", " + pessoaImportadaDto.Numero;

        }
    }
}