using System;
using System.IO;
using System.Text.RegularExpressions;

namespace HelperLib
{
    public class Util
    {
        private const string LogFileName = "HF_Patch_log.txt";

        public static void AppendLog(string targetDirectory, object message)
        {
            try
            {
                File.AppendAllText(Path.Combine(targetDirectory, LogFileName), message + Environment.NewLine);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public static void SafeFileDelete(string file)
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

        public static void SetConfigVariable(string configPath, string settingCategory, string settingName, string value)
        {
            if (!File.Exists(configPath))
            {
                File.WriteAllText(configPath, $"{settingCategory}\n\n{settingName} = {value}");
            }
            else
            {
                var contents = File.ReadAllText(configPath);
                var pattern = $@"^{settingName}.?=.+$";
                if (Regex.IsMatch(contents, pattern, RegexOptions.Multiline))
                {
                    contents = Regex.Replace(contents, pattern, $"{settingName} = {value}", RegexOptions.Multiline);
                    File.WriteAllText(configPath, contents);
                }
                else
                {
                    File.WriteAllText(configPath, $"{settingCategory}\n\n{settingName} = {value}");
                }
            }
        }
    }
}
