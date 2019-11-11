namespace ProjetoCincoSolas.Models
{
    public class PessoaImportadaDto
    {
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Rg { get; set; }
        public string Data_nasc { get; set; }
        public string Signo { get; set; }
        public string Mae { get; set; }
        public string Pai { get; set; }

        public string Email => "wsales.dev@gmail.com";

        public string Senha => "conectar";
        public string Cep { get; set; }
        public string Endereco { get; set; }
        public int Numero { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public string Telefone_fixo { get; set; }
        public string Celular { get; set; }
        public string Altura { get; set; }
        public int Peso { get; set; }
        public string Tipo_sanguineo { get; set; }
        public string Cor { get; set; }
    }
}