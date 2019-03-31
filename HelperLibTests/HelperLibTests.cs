using Microsoft.VisualStudio.TestTools.UnitTesting;
using HelperLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}