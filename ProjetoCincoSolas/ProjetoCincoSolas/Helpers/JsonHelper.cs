using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace ProjetoCincoSolas.Helpers
{
    public class JsonHelper
    {
        public static string ToJson(object obj)
        {
            var serializer = new JavaScriptSerializer();
            return serializer.Serialize(obj);
        }

        public static T ToEntity<T>(string json)
        {
            return new JavaScriptSerializer().Deserialize<T>(json);
        }

        public static string ToStringBase64(string obj)
        {
            return Encoding.UTF8.GetString(Convert.FromBase64String(obj));
        }

        public static string ToJsonBase64(object obj)
        {
            var json = ToJson(obj);
            return Convert.ToBase64String(Encoding.UTF8.GetBytes(json));
        }

        public static string ToJson(object obj, int recursionDepth)
        {
            var serializer = new JavaScriptSerializer { RecursionLimit = recursionDepth };
            return serializer.Serialize(obj);
        }
    }
}