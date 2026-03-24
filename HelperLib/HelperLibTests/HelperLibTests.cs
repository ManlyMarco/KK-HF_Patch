using NUnit.Framework;
using HelperLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace HelperLib.Tests
{
    [TestFixture]
    public class HelperLibTests
    {

        /*
        [Test]
        public void RemoveSideloaderDuplicatesTest()
        {
            HelperLib.RemoveSideloaderDuplicates(@"D:\_Koikatu\_koikatu hf patch test");
        }

        [Test]
        public void CreateBackupTest()
        {
            HelperLib.CreateBackup(@"D:\Games\Koikatsu");
        }

        [Test]
        public void RemoveModsExceptModpacksTest()
        {
            HelperLib.RemoveModsExceptModpacks(@"D:\Games\Koikatsu");
        }

        [Test]
        public void SetConfigVariableTest()
        {
            Util.SetConfigVariable(Path.Combine(@"F:\Games\KoikatsuP", @"BepInEx\config\KK_PregnancyPlus.cfg"), "[KK_Pregnancy Integration]", "Override KK_Pregnancy belly shape", "true");
        }*/

        [Test]
        public void SteamFindTest()
        {
            var s = new Steam();
            var apps = s.SteamAppsLocations.ToList();
            if (apps.Count != 2)
                Assert.Fail("Expected 2 steamapps locations, found " + apps.Count);
        }

        [Test]
        public void FindAppPathIfInstalledTest()
        {
            var s = new Steam();
            var party = s.FindAppPathIfInstalled("Koikatsu Party");
            if (party == null)
                Assert.Fail("Koikatsu Party not found in steamapps locations");
            if (!Directory.Exists(party))
                Assert.Fail("Koikatsu Party path does not exist: " + party);
        }
    }
}