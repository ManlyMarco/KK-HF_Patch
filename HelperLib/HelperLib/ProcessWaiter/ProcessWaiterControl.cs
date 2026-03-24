/*
    Copyright (c) 2017 Marcin Szeniak (https://github.com/Klocman/)
    Apache License Version 2.0
*/

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timer = System.Timers.Timer;

namespace KKManager.Util.ProcessWaiter
{
    public partial class ProcessWaiterControl : UserControl
    {
        private readonly Timer _timer = new Timer(600);
        private static readonly string DefaultImageKey = "Default";

        public async Task Initialize(int[] processIDs, bool processChildren)
        {
            treeView1.ShowRootLines = processChildren;

            await SetNodes(processIDs, processChildren);
        }

        public bool ProcessesStillRunning => treeView1.Nodes.Count > 0;

        public void StartUpdating()
        {
            _timer.Start();
        }

        public ProcessWaiterControl()
        {
            InitializeComponent();

            _timer.Elapsed += updateTimer_Tick;
            _timer.AutoReset = false;
            _timer.SynchronizingObject = this;
        }

        private IEnumerable<Process> MainMonitoredProcesses
        {
            get { return treeView1.Nodes.Cast<TreeNode>().Select(x => x.Tag as Process); }
        }

        private List<Tuple<Process, Icon>> FindProcesses(int[] processIDs)
        {
            var results = new List<Tuple<Process, Icon>>();

            foreach (var id in processIDs)
            {
                try
                {
                    var p = Process.GetProcessById(id);
                    if (p.HasExited) continue;

                    Icon ico = null;
                    try
                    {
                        ico = Icon.ExtractAssociatedIcon(p.MainModule.FileName);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);
                    }

                    results.Add(new Tuple<Process, Icon>(p, ico));
                }
                catch (Exception ex)
                {
                    // Probably the main process exited, remove it from the task
                    Console.WriteLine(ex);
                }
            }

            return results;
        }

        private async Task SetNodes(int[] processIDs, bool processChildren)
        {
            var il = new ImageList();
            il.Images.Add(DefaultImageKey, SystemIcons.Application);
            treeView1.ImageKey = DefaultImageKey;

            //(ParentForm ?? Parent).Enabled = false;
            var results = await AddProcesses(processIDs, processChildren, il);
            
            treeView1.Nodes.Clear();
            var prev = treeView1.ImageList;
            treeView1.ImageList = il;
            prev?.Dispose();

            treeView1.Nodes.AddRange(results.ToArray());

            //(ParentForm ?? Parent).Enabled = true;
        }

        private async Task<List<TreeNode>> AddProcesses(int[] processIDs, bool processChildren, ImageList il)
        {
            List<Tuple<Process, Icon>> processes = null;
            await Task.Run(() => processes = FindProcesses(processIDs));

            var results = new List<TreeNode>();
            if (processes == null) return results;

            foreach (var process in processes)
            {
                var mainPrName = string.IsNullOrEmpty(process.Item1.MainWindowTitle) ? process.Item1.ProcessName : process.Item1.MainWindowTitle;
                var node = new TreeNode(mainPrName)
                {
                    SelectedImageKey = mainPrName,
                    ImageKey = mainPrName,
                    Tag = process.Item1
                };
                results.Add(node);

                if (process.Item2 != null)
                    il.Images.Add(mainPrName, process.Item2);

                if (processChildren)
                {
                    try
                    {
                        var children = ProcessTools.GetChildProcesses(process.Item1.Id);

                        var childProcesses = await AddProcesses(children.ToArray(), processChildren, il);
                        node.Nodes.AddRange(childProcesses.ToArray());
                    }
                    catch (Exception ex)
                    {
                        // Ignore, probably the process exited by now. The child nodes are not important
                        Console.WriteLine(ex);
                    }
                }
            }
            return results;
        }

        public bool ShowIgnoreAndCancel
        {
            get
            {
                return buttonCancel.Enabled;
            }
            set
            {
                buttonIgnore.Enabled = value;
                buttonIgnore.Visible = value;
                buttonCancel.Enabled = value;
                buttonCancel.Visible = value;
                panel2c.Visible = value;
                panel4c.Visible = value;
            }
        }

        public event EventHandler AllProcessesClosed;
        public event EventHandler CancelClicked;

        private void buttonIgnore_Click(object sender, EventArgs e)
        {
            AllProcessesClosed?.Invoke(sender, e);
        }

        private void buttonKillAll_Click(object sender, EventArgs e)
        {
            // ask if sure and kill
            if (MessageBox.Show("Are you sure you want to close all of the listed applications? Any unsaved data will be lost.", "Close all applications", MessageBoxButtons.OKCancel) != DialogResult.OK)
                return;

            foreach (var id in MainMonitoredProcesses)
            {
                try
                {
                    id.Kill();
                }
                catch (Exception ex)
                {
                    // Ignore, probably the process exited by now
                    Console.WriteLine(ex);
                }
            }
        }

        private void updateTimer_Tick(object sender, EventArgs e)
        {
            foreach (var node in treeView1.Nodes.Cast<TreeNode>().ToArray())
            {
                try
                {
                    var pr = node.Tag as Process;
                    if (pr == null || pr.HasExited)
                    {
                        treeView1.Nodes.Remove(node);
                    }
                    else
                    {
                        foreach (var subNode in node.Nodes.Cast<TreeNode>().ToArray())
                        {
                            try
                            {
                                var spr = subNode.Tag as Process;
                                if (spr == null || spr.HasExited)
                                    node.Nodes.Remove(subNode);
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex);
                                node.Nodes.Remove(subNode);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    treeView1.Nodes.Remove(node);
                }
            }

            if (treeView1.Nodes.Count <= 0)
                AllProcessesClosed?.Invoke(sender, e);
            else
                _timer.Start();
        }

        private void buttonKill_Click(object sender, EventArgs e)
        {
            var process = treeView1.SelectedNode?.Tag as Process;
            if (process == null) return;
            try { process.Kill(); }
            catch (Exception ex) { Console.WriteLine(ex); }
        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {
            buttonKill.Enabled = treeView1.SelectedNode != null;
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            CancelClicked?.Invoke(sender, e);
        }

        public void StopUpdating()
        {
            _timer.Stop();
        }
    }
}