using System;

namespace ProjetoCincoSolas.Helpers
{
    public static class Extensoes
    {
        /// <summary>
        /// Retorna uma cadeia de caracteres que representa o objeto atual.
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static int IntToString(this string str)
        {
            return !string.IsNullOrEmpty(str) ? int.Parse(str) : 0;
        }

        /// <summary>
        /// Retorna object em inteiro
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static int ObjectToInt(this object str)
        {
            return str != null ? int.Parse(str.ToString()) : 0;
        }
    }
}