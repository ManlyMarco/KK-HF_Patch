/*
    Copyright (c) 2017 Marcin Szeniak (https://github.com/Klocman/)
    Apache License Version 2.0
*/

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KKManager.Util.ProcessWaiter
{
    public partial class ProcessWaiter : Form
    {
        private ProcessWaiter()
        {
            InitializeComponent();

            processWaiterControl1.AllProcessesClosed += ProcessWaiterControl1_AllProcessesClosed;
            processWaiterControl1.CancelClicked += ProcessWaiterControl1_CancelClicked;
        }

        private void ProcessWaiterControl1_CancelClicked(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
            Close();
        }

        private void ProcessWaiterControl1_AllProcessesClosed(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
            Close();
        }

        /// <summary>
        ///     Returns flase if user cancels the operation.
        /// </summary>
        /// <param name="owner"></param>
        /// <param name="processIDs">IDs of processes to check</param>
        /// <param name="processChildren">Check child processes as well</param>
        /// <returns></returns>
        public static async Task<bool> ShowDialog(Form owner, int[] processIDs, bool processChildren)
        {
            using (var pw = new ProcessWaiter())
            {
                pw.Icon = owner.Icon;
                await pw.processWaiterControl1.Initialize(processIDs, processChildren);
                return pw.ShowDialog(owner) == DialogResult.OK;
            }
        }

        /// <summary>
        /// true if user accepted, false if user cancelled, null if no applications were found so dialog was not shown.
        /// </summary>
        public static async Task<bool?> CheckForRunningProcesses(string[] filters, string[] processNameExcludeRegexes, Form parentForm = null)
        {
            if (!IsAdministrator)
            {
                Console.WriteLine("Could not check if running processes have any game files locked because the application is not running as administrator");
                return null;
            }

            int[] idsToCheck = { };
            await Task.Run(() => idsToCheck = GetRelatedProcessIds(filters, processNameExcludeRegexes));

            if (idsToCheck.Length == 0) return null;

            return await ShowDialog(parentForm ?? ActiveForm, idsToCheck.ToArray(), false);
        }

        private static bool IsAdministrator
        {
            get
            {
                try
                {
                    var wi = WindowsIdentity.GetCurrent();
                    var wp = new WindowsPrincipal(wi);
                    return wp.IsInRole(WindowsBuiltInRole.Administrator);
                }
                catch
                {
                    return false;
                }
            }
        }

        private static int[] GetRelatedProcessIds(string[] filenamesToSearch, string[] processNameExcludeRegexes)
        {
            var myProcessId = Process.GetCurrentProcess().Id;
            var idsToCheck = new List<int>();
            foreach (var pr in Process.GetProcesses())
            {
                try
                {
                    if (pr.Id == myProcessId || pr.HasExited || processNameExcludeRegexes.Any(x => Regex.IsMatch(pr.ProcessName, x)))
                        continue;

                    var filenames = pr.Modules.Cast<ProcessModule>()
                        .Select(x => x.FileName)
                        .Where(s => !string.IsNullOrEmpty(s))
                        .Distinct();

                    if (filenames.Any(filename => filenamesToSearch.Any(filter =>
                    {
                        if (string.IsNullOrEmpty(filename))
                            return false;

                        if (!Path.IsPathRooted(filename))
                            return false;

                        return filename.StartsWith(filter, StringComparison.OrdinalIgnoreCase);
                    })))
                    {
                        idsToCheck.Add(pr.Id);
                    }
                }
                catch
                {
                    // Ignore invalid processes
                }
            }

            return idsToCheck.ToArray();
        }

        private void ProcessWaiter_Shown(object sender, EventArgs e)
        {
            processWaiterControl1.StartUpdating();
        }
    }
}