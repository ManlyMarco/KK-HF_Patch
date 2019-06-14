using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using System.Xml.Linq;
using RGiesecke.DllExport;

namespace HelperLib
{
    public class HelperLib
    {
        private const string LogFileName = "HF_Patch_log.txt";

        private static void AppendLog(string targetDirectory, object message)
        {
            try
            {
                File.AppendAllText(Path.Combine(targetDirectory, LogFileName), message.ToString() + Environment.NewLine);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        private static readonly string[] FilesToDeleteForTranslation =
        {
            @"bg\チャペル_夕.png",
            @"bg\チャペル_昼.png",
            @"bg\公園_夕.png",
            @"bg\公園_夜.png",
            @"bg\公園_昼.png",
            @"bg\夜景.png",
            @"bg\宇宙空間01.png",
            @"bg\宇宙空間02.png",
            @"bg\宇宙空間03.png",
            @"bg\宇宙空間04.png",
            @"bg\遊園地_夕.png",
            @"bg\遊園地_夜.png",
            @"bg\遊園地_昼.png",
            @"bg\駅前_夕.png",
            @"bg\駅前_夜.png",
            @"bg\駅前_昼.png",
            @"chara\female\お嬢様.png",
            @"chara\female\のじゃっ子.png",
            @"chara\female\ひねくれ.png",
            @"chara\female\ものぐさ.png",
            @"chara\female\オタク女子.png",
            @"chara\female\ギャル.png",
            @"chara\female\ギャル2.png",
            @"chara\female\セクシー.png",
            @"chara\female\ボーイッシュ.png",
            @"chara\female\ミステリアス.png",
            @"chara\female\ミーハー.png",
            @"chara\female\モジモジ.png",
            @"chara\female\ヤンデレ.png",
            @"chara\female\不幸少女.png",
            @"chara\female\不良少女.png",
            @"chara\female\勝ち気.png",
            @"chara\female\単純.png",
            @"chara\female\単純2.png",
            @"chara\female\大和撫子.png",
            @"chara\female\姉御肌.png",
            @"chara\female\後輩キャラ.png",
            @"chara\female\意地っ張り.png",
            @"chara\female\意識高いクール.png",
            @"chara\female\意識高いクール2.png",
            @"chara\female\文学少女.png",
            @"chara\female\正統派ヒロイン.png",
            @"chara\female\正統派ヒロイン2.png",
            @"chara\female\母性的.png",
            @"chara\female\母性的2.png",
            @"chara\female\気さく.png",
            @"chara\female\無口.png",
            @"chara\female\無口2.png",
            @"chara\female\純真無垢.png",
            @"chara\female\純真無垢2.png",
            @"chara\female\素直クール.png",
            @"chara\female\素直クール2.png",
            @"chara\female\艶やか.png",
            @"chara\female\誠実.png",
            @"chara\female\邪気眼.png",
            @"chara\female\野性的.png",
            @"chara\female\電波.png",
            @"chara\female\高飛車.png",
            @"coordinate\お泊り１.png",
            @"coordinate\お泊り２.png",
            @"coordinate\アイドル.png",
            @"coordinate\キャビンアテンダント.png",
            @"coordinate\キュートナース.png",
            @"coordinate\クリスマス.png",
            @"coordinate\クロスホルター.png",
            @"coordinate\サスペンダー.png",
            @"coordinate\ショートパレオ（単色）.png",
            @"coordinate\ショートパレオ.png",
            @"coordinate\シースルーパレオ.png",
            @"coordinate\セクシーパレオ.png",
            @"coordinate\セクシーランジェリー.png",
            @"coordinate\チアガール.png",
            @"coordinate\ハイクオリティメイド.png",
            @"coordinate\ハロウィン.png",
            @"coordinate\パレオ.png",
            @"coordinate\ビキニ水着（フリル付き）.png",
            @"coordinate\フリルワンピース.png",
            @"coordinate\マイクロモノキニ.png",
            @"coordinate\メカ.png",
            @"coordinate\ラインタンガ.png",
            @"coordinate\ワンピース(無地).png",
            @"coordinate\ワンピース(花柄).png",
            @"coordinate\体操着.png",
            @"coordinate\全身タイツ.png",
            @"coordinate\制服.png",
            @"coordinate\和メイド.png",
            @"coordinate\大人ワンピース.png",
            @"coordinate\小悪魔.png",
            @"coordinate\巫女武者.png",
            @"coordinate\教師.png",
            @"coordinate\水着.png",
            @"coordinate\白衣.png",
            @"coordinate\私服.png",
            @"coordinate\裸エプロン.png",
            @"coordinate\裸サスペンダー.png",
            @"coordinate\軍服.png",
            @"coordinate\騎士.png",
            @"coordinate\鬼神.png",
            @"coordinate\魔法少女.png",
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

        [DllExport("SetConfigDefaults", CallingConvention = CallingConvention.StdCall)]
        public static void SetConfigDefaults([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            var ud = Path.Combine(path, @"BepInEx\config.ini");

            try
            {
                if (!File.Exists(ud))
                {
                    Directory.CreateDirectory(Path.Combine(path, @"BepInEx"));
                    File.WriteAllText(ud, string.Empty);
                }

                var contents = File.ReadAllLines(ud).ToList();

                // Prevent toasters exploding by default
                if (contents.All(x => !x.Contains("[KK_ForceHighPoly]")))
                {
                    contents.Add("");
                    contents.Add("[KK_ForceHighPoly]");
                    contents.Add("Enabled=False");
                }

                // Best tool in the shed
                if (contents.All(x => !x.Contains("[KK_UncensorSelector]")))
                {
                    contents.Add("");
                    contents.Add("[KK_UncensorSelector]");
                    contents.Add("DefaultMalePenis=SoS");
                }

                // Fix VMD for darkness
                var vmdIndex = contents.FindIndex(s => s.ToLower().Contains("[VMDPlay]".ToLower()));
                if (vmdIndex >= 0)
                {
                    var i = contents.FindIndex(vmdIndex, s => s.StartsWith("CacheGagEyesTexture"));
                    if (i > vmdIndex)
                        contents[i] = "CacheGagEyesTexture=False";
                    else
                        contents.Insert(vmdIndex + 1, "CacheGagEyesTexture=False");
                }
                else
                {
                    contents.Add("");
                    contents.Add("[VMDPlay]");
                    contents.Add("CacheGagEyesTexture=False");
                }

                File.WriteAllLines(ud, contents.ToArray());
            }
            catch (Exception e)
            {
                AppendLog(path, "Failed trying to set config.ini defaults: " + e);
            }
        }

        [DllExport("WriteVersionFile", CallingConvention = CallingConvention.StdCall)]
        public static void WriteVersionFile([MarshalAs(UnmanagedType.LPWStr)] string path, [MarshalAs(UnmanagedType.LPWStr)] string version)
        {
            var verPath = Path.Combine(path, @"version");
            try
            {
                var contents = File.Exists(verPath) ? File.ReadAllText(verPath).Trim() : string.Empty;

                if (!string.IsNullOrEmpty(contents))
                    contents += "; ";

                contents += "HF Patch v" + version;

                File.WriteAllText(verPath, contents);
            }
            catch (Exception e)
            {
                AppendLog(path, "Failed trying to write version file: " + e);
            }
        }

        [DllExport("FixConfig", CallingConvention = CallingConvention.StdCall)]
        public static void FixConfig([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            var ud = Path.Combine(path, @"UserData\setup.xml");
            
            try
            {
                using (var reader = File.OpenRead(ud))
                {
                    var r = XDocument.Load(reader).Root;

                    var s = r.Element("Size").Value;
                    var w = int.Parse(r.Element("Width").Value);
                    var h = int.Parse(r.Element("Height").Value);
                    if (w < 200 || h < 200 || w <= h
                        || !s.Contains(w.ToString(CultureInfo.InvariantCulture))
                        || !s.Contains(h.ToString(CultureInfo.InvariantCulture)))
                        throw new Exception();

                    var _ = bool.Parse(r.Element("FullScreen").Value);
                    CheckRange(r.Element("Quality").Value, 0, 2);
                    CheckRange(r.Element("Display").Value, 0, Screen.AllScreens.Length);
                    CheckRange(r.Element("Language").Value, 0, 2);
                }
            }
            catch (Exception e)
            {
                try
                {
                    File.Delete(ud);
                    File.WriteAllText(ud, GoodSettings, Encoding.Unicode);

                    if (!(e is FileNotFoundException))
                        AppendLog(path, @"Fixed corrupted " + ud + "; Cause:" + e.Message);
                }
                catch { }
            }

            var sysDir = Path.Combine(path, @"UserData\config\system.xml");
            try
            {
                using (var reader = File.OpenRead(sysDir))
                {
                    var sysConfig = XDocument.Load(reader);

                    var etc = sysConfig.Root?.Element("Etc") ?? throw new Exception();
                    etc.SetElementValue("loadHeadAccessory", "False");
                    etc.SetElementValue("loadAllAccessory", "True");
                    etc.SetElementValue("SemenType", "1");

                    // Reset shadow type if it's invalid
                    if (!int.TryParse(etc.Element("rampId")?.Value, out var res) || res > 1000000)
                        etc.SetElementValue("rampId", "0");

                    var add = sysConfig.Root.Element("Add") ?? throw new Exception();
                    add.SetElementValue("TalkTimeNoneWalkStop", "True");
                    add.SetElementValue("OtherClassRegisterMax", "True");
                    add.SetElementValue("AINotPlayerTarget", "False");
                    add.SetElementValue("AINotPlayerTargetCommunication", "True");
                    add.SetElementValue("AIActionCorrectionH", "30");

                    reader.Dispose();
                    sysConfig.Save(sysDir);
                }
            }
            catch (Exception e)
            {
                try
                {
                    File.Delete(sysDir);

                    if (!(e is FileNotFoundException))
                        AppendLog(path, @"Reset corrupted " + sysDir + Environment.NewLine + e + Environment.NewLine);
                }
                catch { }
            }
        }

        private static void CheckRange(string instr, int min, int max)
        {
            var val = int.Parse(instr);
            if (min > val || val > max)
                throw new Exception();
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
                AppendLog(path, e);
            }
        }

        [DllExport("RemoveNonstandardListfiles", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveNonstandardListfiles([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var ld = Path.Combine(path, @"abdata\list\characustom");
                if (Directory.Exists(ld))
                {
                    foreach (var filePath in Directory.GetFiles(ld))
                    {
                        if (!IsStandardListFile(filePath))
                            SafeFileDelete(filePath);
                    }
                }

                var hld = Path.Combine(path, @"abdata\h\list");
                if (Directory.Exists(hld))
                {
                    foreach (var filePath in Directory.GetFiles(hld))
                    {
                        if (!IsStandardHListFile(filePath))
                            SafeFileDelete(filePath);
                    }
                }

                var sld = Path.Combine(path, @"abdata\studio\info");
                if (Directory.Exists(sld))
                {
                    foreach (var filePath in Directory.GetFiles(sld))
                    {
                        if (!IsStandardListFile(filePath))
                            SafeFileDelete(filePath);
                    }
                }
            }
            catch (Exception e)
            {
                AppendLog(path, e);
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
                AppendLog(path, e);
            }
        }

        private static void SideloaderCleanupByManifest(IEnumerable<string> allMods)
        {
            try
            {
                var mods = new List<SideloaderModInfo>();

                foreach (var mod in allMods)
                {
                    try
                    {
                        using (var zs = new FileStream(mod, FileMode.Open, FileAccess.Read))
                        using (var zf = new ZipArchive(zs))
                        {
                            var manifestEntry = zf.Entries.FirstOrDefault(
                                x =>
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
            catch (Exception ex)
            {
                Console.WriteLine(ex);
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