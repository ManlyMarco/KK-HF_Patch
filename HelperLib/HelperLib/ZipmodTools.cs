using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Xml.Linq;

namespace HelperLib
{
    public class ZipmodTools
    {
        public static SideloaderModInfo LoadSideloaderModInfo(string mod)
        {
            using (var zs = new FileStream(mod, FileMode.Open, FileAccess.Read))
            using (var zf = new ZipArchive(zs))
            {
                var manifestEntry = zf.Entries.FirstOrDefault(x => x.Name.Equals("manifest.xml", StringComparison.OrdinalIgnoreCase));

                if (manifestEntry == null)
                {
                    throw new InvalidDataException("zipmod has no manifest");
                }

                using (var fileStream = manifestEntry.Open())
                {
                    var manifest = XDocument.Load(fileStream, LoadOptions.None);

                    if (manifest.Root == null || !manifest.Root.HasElements)
                        throw new InvalidDataException("The manifest.xml file is in an invalid format");

                    var guid = manifest.Root.Element("guid")?.Value;
                    if (string.IsNullOrWhiteSpace(guid))
                        throw new InvalidDataException("The manifest.xml file is missing guid");

                    return new SideloaderModInfo(mod, guid, manifest.Root.Element("version")?.Value);
                }
            }
        }

        public static bool FileHasZipmodExtension(string fileName)
        {
            return fileName.EndsWith(".zipmod", StringComparison.OrdinalIgnoreCase) || fileName.EndsWith(".zi_mod", StringComparison.OrdinalIgnoreCase);
        }

        public class SideloaderModInfo
        {
            public readonly string Guid;
            public readonly string Path;
            public readonly string Version;

            public SideloaderModInfo(string path, string guid, string version)
            {
                Path = path;
                Guid = guid;
                Version = version;
            }
        }

        public class VersionComparer : Comparer<string>
        {
            public override int Compare(string x, string y)
            {
                return CompareVersions(x, y);
            }

            public static int CompareVersions(string firstVer, string secondVer)
            {
                firstVer = firstVer?.Trim().TrimStart('v', 'V', 'r', 'R', ' ');
                if (string.IsNullOrEmpty(firstVer)) firstVer = "0";
                secondVer = secondVer?.Trim().TrimStart('v', 'V', 'r', 'R', ' ');
                if (string.IsNullOrEmpty(secondVer)) secondVer = "0";

                if (firstVer == secondVer) return 0;

                var version = new { First = Tokenize(firstVer), Second = Tokenize(secondVer) };
                var limit = Math.Max(version.First.Count, version.Second.Count);
                for (var i = 0; i < limit; i++)
                {
                    var first = version.First.ElementAtOrDefault(i) ?? 0;
                    var second = version.Second.ElementAtOrDefault(i) ?? 0;
                    try
                    {
                        var result = first.CompareTo(second);
                        if (result != 0)
                            return result;
                    }
                    catch (ArgumentException)
                    {
                        var s1 = first.ToString();
                        var s2 = second.ToString();

                        if (s1 == "0" && s2 != "0")
                            return -1;

                        if (s2 == "0" && s1 != "0")
                            return 1;

                        // Handle invalid characters in strings by comparing them byte by byte
                        var result = string.CompareOrdinal(s1, s2);
                        if (result != 0)
                            return result;
                    }
                }

                return 0;
            }

            private static ICollection<IComparable> Tokenize(string version)
            {
                var results = new List<IComparable>(2);
                foreach (var part in version.Trim().Split('.', ' ', '-', ',', '_'))
                {
                    if (part.Length == 0)
                    {
                        results.Add(0);
                        continue;
                    }

                    // Handle mixed digit + letter parts by splitting them (1.0a -> 1 0 a)
                    var isDigit = char.IsDigit(part[0]);
                    var current = part[0].ToString();
                    for (int i = 1; i < part.Length; i++)
                    {
                        if (isDigit == char.IsDigit(part[i]))
                        {
                            current += part[i];
                        }
                        else
                        {
                            results.Add(Parse(current));
                            current = part[i].ToString();
                            isDigit = !isDigit;
                        }
                    }

                    results.Add(Parse(current));
                }

                return results;
            }

            private static IComparable Parse(string version) => int.TryParse(version, out var result) ? (IComparable)result : version;
        }

        public static List<string> GetAllZipmods(string path)
        {
            var ld = path.EndsWith("\\mods", StringComparison.OrdinalIgnoreCase) ? path : Path.Combine(path, @"mods");
            if (!Directory.Exists(ld))
            {
                return new List<string>();
            }

            return (from file in Directory.GetFiles(ld, "*", SearchOption.AllDirectories)
                    where file.EndsWith(".zip", StringComparison.OrdinalIgnoreCase)
                          || file.EndsWith(".zi_", StringComparison.OrdinalIgnoreCase)
                          || ZipmodTools.FileHasZipmodExtension(file)
                    select file).ToList();
        }
    }
}
