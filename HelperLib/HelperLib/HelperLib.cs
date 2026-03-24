/*
    Copyright (C) 2020  ManlyMarco

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
*/

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using System.Xml.Linq;
using KKManager.Util.ProcessWaiter;
using Microsoft.Win32;
using RGiesecke.DllExport;

namespace HelperLib
{
    public class HelperLib
    {
        [DllExport("FindInstallLocation", CallingConvention = CallingConvention.StdCall)]
        [return: MarshalAs(UnmanagedType.LPWStr)]
        public static void FindInstallLocation([MarshalAs(UnmanagedType.LPWStr)] string path, 
                                               [MarshalAs(UnmanagedType.LPWStr)] string companyName, 
                                               [MarshalAs(UnmanagedType.LPWStr)] string gameName, 
                                               [MarshalAs(UnmanagedType.LPWStr)] string gameNameSteam,
                                               [MarshalAs(UnmanagedType.BStr)] out string strout)
        {
            strout = CheckRegistryKey(path, companyName, gameName) ?? CheckRegistryKey(path, companyName, gameNameSteam);

            if (strout != null) return;

            try
            {
                var steamLoc = new Steam().FindAppPathIfInstalled(gameNameSteam);
                if (Directory.Exists(steamLoc))
                {
                    strout = steamLoc;
                    return;
                }
            }
            catch (Exception e)
            {
                Util.AppendLog(path, e);
            }

            try
            {
                var bruteForcePath = new[]
                    {
                        new DirectoryInfo(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles)),
                        new DirectoryInfo(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFilesX86)),
                    }
                    .Concat(DriveInfo.GetDrives().AttemptMany(x => x.RootDirectory.GetDirectories()))
                    .AttemptMany(x => x.GetDirectories())
                    .Where(y => y.Name.Contains(gameNameSteam) || y.Name.Contains(gameName))
                    .AttemptMany(x => x.GetFiles())
                    .FirstOrDefault(y => y.Name.Contains(gameNameSteam) || y.Name.Contains(gameName));
                if (Directory.Exists(bruteForcePath?.FullName))
                {
                    strout = bruteForcePath.DirectoryName;
                    return;
                }
            }
            catch (Exception e)
            {
                Util.AppendLog(path, e);
            }

            strout = "C:\\Path to the installed game";
        }

        private static string CheckRegistryKey(string path, string companyName, string gameName)
        {
            try
            {
                var subKey = Registry.CurrentUser.OpenSubKey($@"Software\{companyName}\{gameName}");
                if (subKey != null)
                {
                    var regDir = subKey.GetValue("INSTALLDIR_HFP")?.ToString();
                    if (Directory.Exists(regDir))
                    {
                        return regDir;
                    }

                    regDir = subKey.GetValue("INSTALLDIR")?.ToString();
                    if (Directory.Exists(regDir))
                    {
                        return regDir;
                    }
                }
            }
            catch (Exception e)
            {
                Util.AppendLog(path, e);
            }

            return null;
        }

        [DllExport("VerifyFiles", CallingConvention = CallingConvention.StdCall)]
        public static void VerifyFiles([MarshalAs(UnmanagedType.LPWStr)] string srcexe, [MarshalAs(UnmanagedType.BStr)] out string errormsg)
        {
            errormsg = Verifier.VerifyFiles(srcexe);
        }

        [DllExport("WriteVersionFile", CallingConvention = CallingConvention.StdCall)]
        public static void WriteVersionFile([MarshalAs(UnmanagedType.LPWStr)] string path, [MarshalAs(UnmanagedType.LPWStr)] string version)
        {
            var verPath = Path.Combine(path, @"version");
            try
            {
                // Prevent exception when overwriting hidden file
                if (File.Exists(verPath)) File.SetAttributes(verPath, FileAttributes.Normal);
                File.WriteAllText(verPath, @"HF Patch v" + version);
                File.SetAttributes(verPath, FileAttributes.Hidden | FileAttributes.Archive);
            }
            catch (Exception e)
            {
                Util.AppendLog(path, "Failed trying to write version file: " + e);
            }
        }

        [DllExport("FixConfigIllusion", CallingConvention = CallingConvention.StdCall)]
        [SuppressMessage("ReSharper", "PossibleNullReferenceException")]
        public static void FixConfigIllusion([MarshalAs(UnmanagedType.LPWStr)] string path)
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

                    _ = bool.Parse(r.Element("FullScreen").Value);
                    CheckRange(r.Element("Quality").Value, 0, 2);
                    CheckRange(r.Element("Display").Value, 0, Screen.AllScreens.Length);
                    CheckRange(r.Element("Language").Value, 0, 4);
                }

                void CheckRange(string instr, int min, int max)
                {
                    var val = int.Parse(instr);
                    if (min > val || val > max)
                        throw new Exception();
                }
            }
            catch (Exception e)
            {
                try
                {
                    File.Delete(ud);
                    File.WriteAllText(ud, @"<?xml version=""1.0"" encoding=""utf-16""?>
<Setting>
  <Size>1280 x 720 (16 : 9)</Size>
  <Width>1280</Width>
  <Height>720</Height>
  <Quality>2</Quality>
  <FullScreen>false</FullScreen>
  <Display>0</Display>
  <Language>0</Language>
</Setting>", Encoding.Unicode);

                    if (!(e is FileNotFoundException)) Util.AppendLog(path, @"Fixed corrupted " + ud + "; Cause:" + e.Message);
                }
                catch (Exception ex)
                {
                    Util.AppendLog(path, @"Failed to fix corrupted " + ud + "; Cause:" + ex);
                }
            }
        }

        [DllExport("FixConfigKoikatsu", CallingConvention = CallingConvention.StdCall)]
        public static void FixConfigKoikatsu([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
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

                    // Close the reader to allow overwriting the file
                    // ReSharper disable once DisposeOnUsingVariable
                    reader.Dispose();
                    sysConfig.Save(sysDir);
                }
            }
            catch (Exception e)
            {
                try
                {
                    File.Delete(sysDir);

                    if (!(e is FileNotFoundException)) Util.AppendLog(path, @"Reset corrupted " + sysDir + Environment.NewLine + e + Environment.NewLine);
                }
                catch (Exception ex)
                {
                    Util.AppendLog(path, @"Failed to reset corrupted " + sysDir + Environment.NewLine + ex + Environment.NewLine);
                }
            }
        }

        [DllExport("FixPermissions", CallingConvention = CallingConvention.StdCall)]
        public static void FixPermissions([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                ProcessWaiter.CheckForProcessesBlockingDir(Path.GetFullPath(path)).ConfigureAwait(false).GetAwaiter().GetResult();

                var batContents = $@"
title Fixing permissions... 
rem Get the localized version of Y/N to pass to takeown to make this work in different locales
for /f ""tokens=1,2 delims=[,]"" %%a in ('""choice <nul 2>nul""') do set ""yes=%%a"" & set ""no=%%b""
echo Press %yes% for yes and %no% for no
set target={path.Trim(Path.AltDirectorySeparatorChar, Path.DirectorySeparatorChar, ' ')}
echo off
cls
echo Taking ownership of %target% ...
rem First find is to filter out success messages, second findstr is to filter out empty lines
takeown /F ""%target%"" /R /SKIPSL /D %yes% | find /V ""SUCCESS: The file (or folder):"" | findstr /r /v ""^$""
echo.
echo Fixing access rights ...
icacls ""%target%"" /grant *S-1-1-0:(OI)(CI)F /T /C /L /Q
";
                var batPath = Path.Combine(Path.GetTempPath(), "hfpatch_fixperms.bat");
                File.WriteAllText(batPath, batContents);

                Process.Start(new ProcessStartInfo("cmd", $"/C \"{batPath}\"")
                { WindowStyle = ProcessWindowStyle.Hidden, CreateNoWindow = true });
            }
            catch (Exception ex)
            {
                Util.AppendLog(path, "Failed to fix permissions: " + ex);
            }
        }

        [DllExport("CreateBackup", CallingConvention = CallingConvention.StdCall)]
        public static void CreateBackup([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var fullPath = Path.GetFullPath(path);
                var filesToBackup = new List<string>();

                var bepinPath = Path.Combine(fullPath, "BepInEx");
                if (Directory.Exists(bepinPath))
                    filesToBackup.AddRange(Directory.GetFiles(bepinPath, "*", SearchOption.AllDirectories));

                var scriptsPath = Path.Combine(fullPath, "scripts");
                if (Directory.Exists(scriptsPath))
                    filesToBackup.AddRange(Directory.GetFiles(scriptsPath, "*", SearchOption.AllDirectories));

                var dhhPath = Path.Combine(fullPath, "DHH_Data");
                if (Directory.Exists(dhhPath))
                    filesToBackup.AddRange(Directory.GetFiles(dhhPath, "*", SearchOption.AllDirectories));

                var fridaPath = Path.Combine(fullPath, "frida-scripts");
                if (Directory.Exists(fridaPath))
                {
                    filesToBackup.AddRange(Directory.GetFiles(fridaPath, "*", SearchOption.AllDirectories));
                    filesToBackup.Add(Path.Combine(fullPath, "dxgi.dll"));
                    filesToBackup.Add(Path.Combine(fullPath, "frida-gadget.config"));
                    filesToBackup.Add(Path.Combine(fullPath, "frida-gadget.dll"));
                }

                var patchworkPath = Path.Combine(fullPath, "plugins");
                if (Directory.Exists(patchworkPath))
                    filesToBackup.AddRange(Directory.GetFiles(patchworkPath, "*", SearchOption.AllDirectories));

                if (!filesToBackup.Any()) return;

                using (var file = File.OpenWrite(Path.Combine(fullPath, $"Plugin_Backup_{DateTime.Now:yyyy-MM-dd_HH-mm-ss}.zip")))
                using (var zip = new ZipArchive(file, ZipArchiveMode.Create, false, Encoding.UTF8))
                {
                    foreach (var toAdd in filesToBackup)
                    {
                        try
                        {
                            if (File.Exists(toAdd))
                            {
                                using (var toAddStream = File.OpenRead(toAdd))
                                {
                                    var entry = zip.CreateEntry(toAdd.Substring(fullPath.Length + 1), CompressionLevel.Fastest);
                                    using (var entryStream = entry.Open())
                                        toAddStream.CopyTo(entryStream);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Util.AppendLog(path, $"Failed to add file {toAdd} to backup - {ex}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Util.AppendLog(path, $"Failed to create backup - {ex}");
            }
        }

        [DllExport("RemoveModsExceptModpacks", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveModsExceptModpacks([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var modsPath = Path.GetFullPath(Path.Combine(path, "mods"));
                if (!Directory.Exists(modsPath)) return;

                // Move all mods except the ones in acceptableDirs to the backup folder. Combine with any existing backup to save space
                var backupPath = Path.Combine(path, "mods_BACKUP");

                // Only top files
                MoveDirectory(modsPath, backupPath, SearchOption.TopDirectoryOnly, path);

                // Non modpack subdirectories
                foreach (var subdir in new DirectoryInfo(modsPath).GetDirectories())
                {
                    if (subdir.Name.StartsWith("Sideloader Modpack", StringComparison.OrdinalIgnoreCase)) continue;

                    MoveDirectory(subdir.FullName, Path.Combine(backupPath, subdir.Name), SearchOption.AllDirectories, path);

                    subdir.Refresh();
                    if (!subdir.Exists) continue;

                    // Make extra sure all old mods are gone, doesn't matter if they don't get backed up
                    foreach (var file in Directory.GetFiles(subdir.FullName, "*", SearchOption.AllDirectories))
                    {
                        try
                        {
                            File.Delete(file);
                        }
                        catch (Exception ex)
                        {
                            Util.AppendLog(path, $"Failed to remove file {file} - {ex}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Util.AppendLog(path, $"Failed to remove old mods from the mods directory - {ex}");
            }

            // Taken from https://stackoverflow.com/a/2553245
            void MoveDirectory(string source, string target, SearchOption subdirs, string logpath)
            {
                var sourcePath = source.TrimEnd('\\', ' ');
                var targetPath = target.TrimEnd('\\', ' ');
                var files = Directory.EnumerateFiles(sourcePath, "*", subdirs).GroupBy(Path.GetDirectoryName);
                foreach (var folder in files)
                {
                    var targetFolder = folder.Key.Replace(sourcePath, targetPath);
                    Directory.CreateDirectory(targetFolder);
                    foreach (var file in folder)
                    {
                        try
                        {
                            var targetFile = Path.Combine(targetFolder, Path.GetFileName(file));
                            if (File.Exists(targetFile)) File.Delete(targetFile);
                            File.Move(file, targetFile);
                        }
                        catch (Exception ex)
                        {
                            Util.AppendLog(logpath, $"Failed to move/remove file {file} - {ex}");
                        }
                    }
                }

                if (subdirs == SearchOption.AllDirectories || Directory.GetDirectories(source).Length == 0)
                {
                    try
                    {
                        Directory.Delete(source, true);
                    }
                    catch (Exception ex)
                    {
                        Util.AppendLog(logpath, $"Failed to remove directory {source} - {ex}");
                    }
                }
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
                        if (!IsStandardListFile(filePath)) Util.SafeFileDelete(filePath);
                    }
                }

                var hld = Path.Combine(path, @"abdata\h\list");
                if (Directory.Exists(hld))
                {
                    foreach (var filePath in Directory.GetFiles(hld))
                    {
                        if (!IsStandardListFile(filePath)) Util.SafeFileDelete(filePath);
                    }
                }

                var sld = Path.Combine(path, @"abdata\studio\info");
                if (Directory.Exists(sld))
                {
                    foreach (var filePath in Directory.GetFiles(sld))
                    {
                        if (!IsStandardListFile(filePath)) Util.SafeFileDelete(filePath);
                    }
                }
            }
            catch (Exception e)
            {
                Util.AppendLog(path, e);
            }

            bool IsStandardListFile(string fileName)
            {
                // Get rid of invalid files like .csv .zipmod or other junk that people somehow manage to put there
                if (!fileName.EndsWith(".unity3d", StringComparison.OrdinalIgnoreCase))
                    return false;
                var filename = Path.GetFileNameWithoutExtension(fileName).ToLower();
                if (filename == "namelist") return true;
                // Official list files only have numbers in them while all custom ones seem to have at least one letter, so this is enough
                return IsDigitsOnly(filename.Replace("_", ""));
            }

            bool IsDigitsOnly(string str)
            {
                foreach (var c in str)
                    if (c < '0' || c > '9')
                        return false;

                return true;
            }
        }

        [DllExport("RemoveSideloaderDuplicates", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveSideloaderDuplicates([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var allMods = ZipmodTools.GetAllZipmods(path);
                SideloaderCleanupByManifest(allMods);
                //SideloaderCleanupByFilename(allMods.Where(File.Exists));
            }
            catch (Exception e)
            {
                Util.AppendLog(path, e);
            }
        }

        private static void SideloaderCleanupByManifest(IEnumerable<string> allMods)
        {
            try
            {
                var mods = new List<ZipmodTools.SideloaderModInfo>();

                foreach (var mod in allMods)
                {
                    try
                    {
                        mods.Add(ZipmodTools.LoadSideloaderModInfo(mod));
                    }
                    catch (SystemException)
                    {
                        // Kill it with fire
                        Util.SafeFileDelete(mod);
                    }
                }

                foreach (var modGroup in mods.GroupBy(x => x.Guid))
                {
                    var orderedMods = modGroup.All(x => !string.IsNullOrWhiteSpace(x.Version))
                        ? modGroup.OrderByDescending(x => x.Path.ToLower().Contains("mods\\sideloader modpack")).ThenByDescending(x => x.Version, new ZipmodTools.VersionComparer())
                        : modGroup.OrderByDescending(x => x.Path.ToLower().Contains("mods\\sideloader modpack")).ThenByDescending(x => File.GetLastWriteTime(x.Path));

                    // Prefer .zipmod extension and then longer paths (so the mod has either longer name or is arranged in a subdirectory)
                    orderedMods = orderedMods.ThenByDescending(x => ZipmodTools.FileHasZipmodExtension(x.Path))
                        .ThenByDescending(x => x.Path.Length);

                    foreach (var oldMod in orderedMods.Skip(1)) Util.SafeFileDelete(oldMod.Path);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        /*private static void SideloaderCleanupByFilename(IEnumerable<string> allMods)
        {
            var modDuplicates = allMods.GroupBy(Path.GetFileNameWithoutExtension);

            foreach (var modVersions in modDuplicates)
            {
                if (modVersions.Count() <= 1) continue;

                // Figure out the newest mod and remove all others. Favor .zipmod versions if both have the same creation date
                var orderedVersions = modVersions.OrderByDescending(File.GetLastWriteTime)
                    .ThenByDescending(FileHasZipmodExtension)
                    // Prefer non-disabled mods
                    .ThenByDescending(x => !Path.GetExtension(x).Contains("_"));
                foreach (var oldModPath in orderedVersions.Skip(1))
                    SafeFileDelete(oldModPath);
            }
        }*/
    }
}
