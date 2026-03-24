using System;
using System.Collections.Generic;

namespace HelperLib
{
    internal static class Extensions
    {
        public static IEnumerable<TOut> AttemptMany<TIn, TOut>(this IEnumerable<TIn> baseEnumerable, Func<TIn, TOut[]> action)
        {
            foreach (var item in baseEnumerable)
            {
                TOut[] output;
                try
                {
                    output = action(item);
                }
                catch (Exception e)
                {
                    Console.Error.WriteLine(e);
                    continue;
                }

                foreach (var @out in output)
                {
                    yield return @out;

                }
            }
        }
    }
}
