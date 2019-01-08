using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.VisualBasic;

namespace ProjetoCincoSolas.Helpers
{
    public static class CalendarioHelper
    {
        public static int CalculateIdade(DateTime dataNascimento)
        {
            return (int)DateAndTime.DateDiff(DateInterval.Year, dataNascimento, DateTime.Now);
        }

        /// <summary>
        /// Verifica se a data de nascimento é valida sendo ela maior  ou igual a 18
        /// anos de idade e menor ou igual a 110 anos e retorna um boleano (verdadeiro / falso)
        /// </summary>
        /// <param name="dataNascimento"></param>
        /// <returns></returns>
        public static bool IsDataNascimentoValida(DateTime? dataNascimento)
        {
            var idade = 0;

            if (dataNascimento != null)
            {
                idade = CalculateIdade((DateTime)dataNascimento);
            }

            return idade <= 110 && idade >= 18;
        }
    }
}