using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoCincoSolas.Helpers
{

    public static class ConversorHelper
    {
        public static void ForEach<T>(this IEnumerable<T> list, Action<T> action)
        {
            foreach (T item in list)
                action(item);
        }

        /// <summary>
        /// Retorna um boleano verificando se a string de número pode converter e retornar um inteiro
        /// </summary>
        /// <param name="numero"></param>
        /// <returns></returns>
        public static bool IsNumeric(string numero)
        {
            int retorno;

            var isNum = int.TryParse(numero, out retorno);
            return isNum;
        }

        /// <summary>
        /// Retorna um boleano verificando se a string de número pode converter e retornar um decimal
        /// </summary>
        /// <param name="numero"></param>
        /// <returns></returns>
        public static bool IsDecimal(string numero)
        {
            decimal retorno;

            var isNum = decimal.TryParse(numero, out retorno);
            return isNum;
        }

        public static int? ConverterParaIntNullable(string numero)
        {
            if (string.IsNullOrWhiteSpace(numero))
            {
                return null;
            }
            return int.Parse(numero);
        }

        public static int ConverterParaInt(string numero)
        {
            return string.IsNullOrWhiteSpace(numero) ? 0 : int.Parse(numero);
        }

        public static decimal ConverterParaDecimal(string numero)
        {
            return string.IsNullOrWhiteSpace(numero) ? 0 : decimal.Parse(numero);
        }
    }
}