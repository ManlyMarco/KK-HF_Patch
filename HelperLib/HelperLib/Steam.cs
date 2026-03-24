using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.Win32;

namespace HelperLib
{
    public class Steam
    {
        public Steam()
        {
            InstallationDirectory = FindSteamInstallationLocation();
            MainExecutableFilename = Path.Combine(InstallationDirectory, "Steam.exe");
            SteamAppsLocations = FindSteamAppsLocations(InstallationDirectory).ToList();
        }

        /// <summary>
        /// Main Steam installation directory
        /// </summary>
        public string InstallationDirectory { get; }

        /// <summary>
        /// Paths to all Steam library folders
        /// </summary>
        public IReadOnlyCollection<string> SteamAppsLocations { get; }

        /// <summary>
        /// Path to steam.exe
        /// </summary>
        public string MainExecutableFilename { get; }

        /// <summary>
        /// Get a full path to the game's folder if it's installed on Steam. Returns null if game is not installed.
        /// </summary>
        /// <param name="appFolderName">Name of the game's folder inside SteamApps/common. (e.g. `Koikatsu Party`)</param>
        public string FindAppPathIfInstalled(string appFolderName)
        {
            return GetAllCommonApps().FirstOrDefault(x => Path.GetFileName(x).Equals(appFolderName, StringComparison.InvariantCultureIgnoreCase));
        }

        /// <summary>
        /// List all game folder paths in all Steam libraries
        /// </summary>
        public IEnumerable<string> GetAllCommonApps()
        {
            return SteamAppsLocations.Select(x => Path.Combine(x, "common")).Where(Directory.Exists).SelectMany(Directory.GetDirectories);
        }

        private static IEnumerable<string> FindSteamAppsLocations(string installationDirectory)
        {
            var steamApps = new List<string> { Path.Combine(installationDirectory, @"SteamApps") };

            var libFoldersFile = Path.Combine(steamApps[0], @"libraryfolders.vdf");
            if (File.Exists(libFoldersFile))
            {
                foreach (var str in File.ReadAllLines(libFoldersFile))
                {
                    var pieces = str.Split('\"').Where(p => !string.IsNullOrEmpty(p?.Trim())).ToList();
                    if (pieces.Count != 2 || pieces[0] != "path") continue;

                    var path = Path.Combine(pieces[1].Replace(@"\\", @"\"), "SteamApps");
                    steamApps.Add(path);
                }
            }
            return steamApps.Where(Directory.Exists).Select(Path.GetFullPath).Distinct(StringComparer.OrdinalIgnoreCase);
        }

        private static string FindSteamInstallationLocation()
        {
            foreach (var keyPath in new[] { @"SOFTWARE\Valve\Steam", @"SOFTWARE\WOW6432Node\Valve\Steam" })
            {
                using (var key = Registry.LocalMachine.OpenSubKey(keyPath))
                {
                    if (key == null) continue;

                    var path = key.GetValue(@"InstallPath")?.ToString();
                    if (path != null && Directory.Exists(path))
                        return path;
                }
            }

            try
            {
                using (var key = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\Classes\steam\Shell\Open\Command"))
                {
                    var command = key?.GetValue(null)?.ToString();
                    var extractedPath = command?.Split(new[] { '"' }, StringSplitOptions.RemoveEmptyEntries).FirstOrDefault();
                    if (extractedPath != null && extractedPath.Contains("steam.exe"))
                    {
                        var path = Path.GetDirectoryName(extractedPath);

                        if (path != null && Directory.Exists(path))
                            return path;
                    }
                }
                throw new IOException();
            }
            catch (Exception ex)
            {
                throw new IOException(
                    "Failed to detect your Steam installation. Launch Steam, exit it gracefully, and try again.", ex);
            }
        }
    }
}