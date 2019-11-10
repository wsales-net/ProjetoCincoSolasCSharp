using System;

namespace ProjetoCincoSolas.Helpers
{
    public static class Extensoes
    {
        public static int IntToString(this string str)
        {
            if (!string.IsNullOrEmpty(str))
            {
                return Int32.Parse(str);
            }

            return 0;
        }
        /// <summary>
        /// Retorna uma cadeia de caracteres que representa o objeto atual.
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static int ObjectToInt(this object str)
        {
            if (str != null)
            {
                return Int32.Parse(str.ToString());
            }

            return 0;
        }
    }
}