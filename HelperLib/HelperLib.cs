using System;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
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

        [DllExport("RemoveJapaneseCards", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveJapaneseCards([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            var ud = Path.Combine(path, "UserData");
            if (!Directory.Exists(ud)) return;
            foreach (var filename in FilesToDeleteForTranslation)
                SafeFileDelete(Path.Combine(ud, filename));
        }

        [DllExport("RemoveNonstandardListfiles", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveNonstandardListfiles([MarshalAs(UnmanagedType.LPWStr)] string path)
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
        }

        [DllExport("RemoveSideloaderDuplicates", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveSideloaderDuplicates([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            var ld = Path.Combine(path, @"mods");
            if (!Directory.Exists(ld)) return;

            var modDuplicates = from file in Directory.GetFiles(ld, "*", SearchOption.AllDirectories)
                where file.EndsWith(".zip", StringComparison.OrdinalIgnoreCase)
                      || file.EndsWith(".zipmod", StringComparison.OrdinalIgnoreCase)
                group file by Path.GetFileNameWithoutExtension(file);

            foreach (var modVersions in modDuplicates)
            {
                if (modVersions.Count() <= 1) continue;

                // Figure out the newest mod and remove all others. Favor .zipmod versions if both have the same creation date
                var orderedVersions = modVersions.OrderByDescending(File.GetLastWriteTime)
                    .ThenByDescending(x => x.EndsWith(".zipmod", StringComparison.OrdinalIgnoreCase));
                foreach (var oldModPath in orderedVersions.Skip(1))
                    SafeFileDelete(oldModPath);
            }
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
            return IsDigitsOnly(Path.GetFileNameWithoutExtension(fileName));
        }

        private static bool IsDigitsOnly(string str)
        {
            foreach (var c in str)
                if (c < '0' || c > '9')
                    return false;

            return true;
        }
    }
}