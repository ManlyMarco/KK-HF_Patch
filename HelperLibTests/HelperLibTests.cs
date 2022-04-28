using Microsoft.VisualStudio.TestTools.UnitTesting;
using HelperLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace HelperLib.Tests
{
    [TestClass()]
    public class HelperLibTests
    {
        [TestMethod()]
        public void RemoveSideloaderDuplicatesTest()
        {
            HelperLib.RemoveSideloaderDuplicates(@"D:\_Koikatu\_koikatu hf patch test");
        }

        [TestMethod()]
        public void FixConfigTest()
        {
            HelperLib.FixConfig(@"D:\Games\Koikatsu");
        }

        [TestMethod()]
        public void CreateBackupTest()
        {
            HelperLib.CreateBackup(@"D:\Games\Koikatsu");
        }

        [TestMethod()]
        public void RemoveModsExceptModpacksTest()
        {
            HelperLib.RemoveModsExceptModpacks(@"D:\Games\Koikatsu");
        }

        [TestMethod()]
        public void SetConfigVariableTest()
        {
            HelperLib.SetConfigVariable(Path.Combine(@"F:\Games\KoikatsuP", @"BepInEx\config\KK_PregnancyPlus.cfg"), "[KK_Pregnancy Integration]", "Override KK_Pregnancy belly shape", "true");
        }
    }
}