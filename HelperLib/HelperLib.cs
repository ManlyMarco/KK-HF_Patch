using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Xml.Linq;
using RGiesecke.DllExport;

namespace HelperLib
{
    public class HelperLib
    {
        private static readonly string[] FilesToDeleteForTranslation =
        {
            @"bg\宇宙空間01.png",
            @"bg\宇宙空間02.png",
            @"bg\宇宙空間03.png",
            @"bg\宇宙空間04.png",
            @"chara\female\ギャル.png",
            @"chara\female\ギャル2.png",
            @"chara\female\セクシー.png",
            @"chara\female\ひねくれ.png",
            @"chara\female\ミーハー.png",
            @"chara\female\モジモジ.png",
            @"chara\female\ヤンデレ.png",
            @"chara\female\不幸少女.png",
            @"chara\female\単純2.png",
            @"chara\female\後輩キャラ.png",
            @"chara\female\意地っ張り.png",
            @"chara\female\意識高いクール.png",
            @"chara\female\意識高いクール2.png",
            @"chara\female\文学少女.png",
            @"chara\female\正統派ヒロイン.png",
            @"chara\female\正統派ヒロイン2.png",
            @"chara\female\母性的.png",
            @"chara\female\母性的2.png",
            @"chara\female\無口.png",
            @"chara\female\純真無垢.png",
            @"chara\female\高飛車.png",
            @"chara\female\野性的.png",
            @"chara\female\邪気眼.png",
            @"chara\female\素直クール2.png",
            @"chara\female\素直クール.png",
            @"chara\female\純真無垢2.png",
            @"chara\female\無口2.png",
            @"chara\female\姉御肌.png",
            @"chara\female\大和撫子.png",
            @"chara\female\単純.png",
            @"chara\female\不良少女.png",
            @"chara\female\ミステリアス.png",
            @"chara\female\ボーイッシュ.png",
            @"chara\female\オタク女子.png",
            @"chara\female\ものぐさ.png",
            @"chara\female\のじゃっ子.png",
            @"chara\female\お嬢様.png",
            @"chara\female\電波.png",
            @"chara\female\艶やか.png",
            @"chara\female\誠実.png",
            @"chara\female\勝ち気.png",
            @"chara\female\気さく.png",
            @"coordinate\セクシーパレオ.png",
            @"coordinate\セクシーランジェリー.png",
            @"coordinate\チアガール.png",
            @"coordinate\ハイクオリティメイド.png",
            @"coordinate\パレオ.png",
            @"coordinate\フリルワンピース.png",
            @"coordinate\マイクロモノキニ.png",
            @"coordinate\メカ.png",
            @"coordinate\ラインタンガ.png",
            @"coordinate\ワンピース(無地).png",
            @"coordinate\ワンピース(花柄).png",
            @"coordinate\体操着.png",
            @"coordinate\全身タイツ.png",
            @"coordinate\制服.png",
            @"coordinate\大人ワンピース.png",
            @"coordinate\小悪魔.png",
            @"coordinate\巫女武者.png",
            @"coordinate\教師.png",
            @"coordinate\水着.png",
            @"coordinate\白衣.png",
            @"coordinate\私服.png",
            @"coordinate\裸サスペンダー.png",
            @"coordinate\軍服.png",
            @"coordinate\騎士.png",
            @"coordinate\鬼神.png",
            @"coordinate\魔法少女.png",
            @"coordinate\アイドル.png",
            @"coordinate\お泊り１.png",
            @"coordinate\お泊り２.png",
            @"coordinate\キュートナース.png",
            @"coordinate\クロスホルター.png",
            @"coordinate\サスペンダー.png",
            @"coordinate\シースルーパレオ.png",
            @"coordinate\ショートパレオ（単色）.png",
            @"coordinate\ショートパレオ.png"
        };

        private static readonly string GoodSettings =
@"<?xml version=""1.0"" encoding=""utf-16""?>
<Setting>
  <Size>1280 x 720 (16 : 9)</Size>
  <Width>1280</Width>
  <Height>720</Height>
  <Quality>2</Quality>
  <FullScreen>false</FullScreen>
  <Display>0</Display>
  <Language>0</Language>
</Setting>";

        [DllExport("FixConfig", CallingConvention = CallingConvention.StdCall)]
        public static void FixConfig([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            var ud = Path.Combine(path, "UserData\\setup.xml");

            try
            {
                var r = XDocument.Parse(File.ReadAllText(ud)).Root;
                
                var s = r.Element("Size").Value;
                var w = int.Parse(r.Element("Width").Value);
                var h = int.Parse(r.Element("Height").Value);
                if (w < 200 || h < 200 || w <= h || !s.Contains(w.ToString()) || !s.Contains(h.ToString()))
                    throw new Exception();

                var _ = float.Parse(r.Element("FullScreen").Value);
                _ = int.Parse(r.Element("Quality").Value);
                _ = int.Parse(r.Element("Display").Value);
                _ = int.Parse(r.Element("Language").Value);
            }
            catch (Exception e)
            {
                File.Delete(ud);
                File.WriteAllText(ud, GoodSettings, Encoding.Unicode);
            }
        }

        [DllExport("RemoveJapaneseCards", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveJapaneseCards([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var ud = Path.Combine(path, "UserData");
                if (!Directory.Exists(ud)) return;
                foreach (var filename in FilesToDeleteForTranslation)
                    SafeFileDelete(Path.Combine(ud, filename));
            }
            catch (Exception e)
            {
                File.AppendAllText(Assembly.GetExecutingAssembly().Location + ".log", e + Environment.NewLine);
            }
        }

        [DllExport("RemoveNonstandardListfiles", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveNonstandardListfiles([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var ld = Path.Combine(path, @"abdata\list\characustom");
                if (!Directory.Exists(ld)) return;
                foreach (var filePath in Directory.GetFiles(ld))
                {
                    if (!IsStandardListFile(filePath))
                    {
                        SafeFileDelete(filePath);
                    }
                }

                var hld = Path.Combine(path, @"abdata\h\list");
                if (!Directory.Exists(hld)) return;
                foreach (var filePath in Directory.GetFiles(hld))
                {
                    if (!IsStandardHListFile(filePath))
                    {
                        SafeFileDelete(filePath);
                    }
                }
            }
            catch (Exception e)
            {
                File.AppendAllText(Assembly.GetExecutingAssembly().Location + ".log", e + Environment.NewLine);
            }
        }

        [DllExport("RemoveSideloaderDuplicates", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveSideloaderDuplicates([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var ld = Path.Combine(path, @"mods");
                if (!Directory.Exists(ld)) return;

                var allMods = (from file in Directory.GetFiles(ld, "*", SearchOption.AllDirectories)
                               where file.EndsWith(".zip", StringComparison.OrdinalIgnoreCase)
                                     || FileHasZipmodExtension(file)
                               select file).ToList();

                SideloaderCleanupByManifest(allMods);
                SideloaderCleanupByFilename(allMods.Where(File.Exists));
            }
            catch (Exception e)
            {
                File.AppendAllText(Assembly.GetExecutingAssembly().Location + ".log", e + Environment.NewLine);
            }
        }

        private static void SideloaderCleanupByManifest(IEnumerable<string> allMods)
        {
            var mods = new List<SideloaderModInfo>();

            foreach (var mod in allMods)
            {
                try
                {
                    using (var zs = new FileStream(mod, FileMode.Open, FileAccess.Read))
                    using (var zf = new ZipArchive(zs))
                    {
                        var manifestEntry = zf.Entries.FirstOrDefault(x =>
                            x.Name.Equals("manifest.xml", StringComparison.OrdinalIgnoreCase));

                        if (manifestEntry == null)
                        {
                            if (FileHasZipmodExtension(mod))
                                throw new InvalidDataException("zipmod has no manifest");
                            continue;
                        }

                        using (var fileStream = manifestEntry.Open())
                        {
                            var manifest = XDocument.Load(fileStream, LoadOptions.None);

                            if (manifest.Root == null || !manifest.Root.HasElements)
                                throw new InvalidDataException("The manifest.xml file is in an invalid format");

                            var guid = manifest.Root.Element("guid")?.Value;
                            if (string.IsNullOrWhiteSpace(guid))
                                continue;

                            mods.Add(new SideloaderModInfo(mod, guid,
                                manifest.Root.Element("version")?.Value));
                        }
                    }
                }
                catch (SystemException)
                {
                    // Kill it with fire
                    SafeFileDelete(mod);
                }
            }

            foreach (var modGroup in mods.GroupBy(x => x.Guid))
            {
                var orderedMods = modGroup.All(x => !string.IsNullOrWhiteSpace(x.Version))
                    ? modGroup.OrderByDescending(x => x.Version, new VersionComparer())
                    : modGroup.OrderByDescending(x => File.GetLastWriteTime(x.Path));

                // Prefer .zipmod extension and then longer paths (so the mod has either longer name or is arranged in a subdirectory)
                orderedMods = orderedMods.ThenByDescending(x => FileHasZipmodExtension(x.Path))
                    .ThenByDescending(x => x.Path.Length);

                foreach (var oldMod in orderedMods.Skip(1))
                    SafeFileDelete(oldMod.Path);
            }
        }

        private static void SideloaderCleanupByFilename(IEnumerable<string> allMods)
        {
            var modDuplicates = allMods.GroupBy(Path.GetFileNameWithoutExtension);

            foreach (var modVersions in modDuplicates)
            {
                if (modVersions.Count() <= 1) continue;

                // Figure out the newest mod and remove all others. Favor .zipmod versions if both have the same creation date
                var orderedVersions = modVersions.OrderByDescending(File.GetLastWriteTime)
                    .ThenByDescending(FileHasZipmodExtension);
                foreach (var oldModPath in orderedVersions.Skip(1))
                    SafeFileDelete(oldModPath);
            }
        }

        private static bool FileHasZipmodExtension(string fileName)
        {
            return fileName.EndsWith(".zipmod", StringComparison.OrdinalIgnoreCase);
        }

        private static void SafeFileDelete(string file)
        {
            try
            {
                File.Delete(file);
            }
            catch (SystemException)
            {
                // Nom nom nom
            }
        }

        private static bool IsStandardListFile(string fileName)
        {
            // Get rid of invalid files like .csv .zipmod or other junk that people somehow manage to put there
            return fileName.EndsWith(".unity3d", StringComparison.OrdinalIgnoreCase)
                // Official list files only have numbers in them while all custom ones seem to have at least one letter, so this is enough
                && IsDigitsOnly(Path.GetFileNameWithoutExtension(fileName));
        }

        private static bool IsStandardHListFile(string fileName)
        {
            // Get rid of invalid files like .csv .zipmod or other junk that people somehow manage to put there
            if (fileName.EndsWith(".unity3d", StringComparison.OrdinalIgnoreCase))
            {
                // 13_00.unity3d filename format
                var name = Path.GetFileNameWithoutExtension(fileName);

                if (name.Length == 5 && name[2] == '_')
                    return true;
            }
            return false;
        }

        private static bool IsDigitsOnly(string str)
        {
            foreach (var c in str)
                if (c < '0' || c > '9')
                    return false;

            return true;
        }

        private class SideloaderModInfo
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

        public class VersionComparer : IComparer<string>
        {
            public int Compare(string x, string y)
            {
                if (x == y) return 0;
                var version = new { First = GetVersion(x), Second = GetVersion(y) };
                var limit = Math.Max(version.First.Length, version.Second.Length);
                for (var i = 0; i < limit; i++)
                {
                    var first = version.First.ElementAtOrDefault(i) ?? string.Empty;
                    var second = version.Second.ElementAtOrDefault(i) ?? string.Empty;
                    try
                    {
                        var result = first.CompareTo(second);
                        if (result != 0)
                            return result;
                    }
                    catch (ArgumentException)
                    {
                        if (first is string s1 && second is string s2)
                        {
                            // Handle invalid characters in strings by comparing them byte by byte
                            var result = string.CompareOrdinal(s1, s2);
                            if (result != 0)
                                return result;
                        }
                    }
                }
                return version.First.Length.CompareTo(version.Second.Length);
            }

            private IComparable[] GetVersion(string version)
            {
                return (from part in version.Trim().Split('.', ' ', '-', ',', '_')
                        select Parse(part)).ToArray();
            }

            private IComparable Parse(string version)
            {
                if (int.TryParse(version, out var result))
                    return result;
                return version;
            }
        }
    }
}