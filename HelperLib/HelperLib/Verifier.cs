using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace HelperLib
{
    public static class Verifier
    {
        public static string VerifyFiles(string srcexe)
        {
            try
            {
                var exePath = new FileInfo(srcexe);
                var thisPathDirectory = exePath.Directory;
                var thisName = Path.GetFileNameWithoutExtension(exePath.Name);

                using (var md5 = MD5.Create())
                {
                    string[] hashes;
                    using (var r = File.OpenRead(srcexe))
                    {
                        const int count = 1000;
                        var buf = new byte[count];
                        r.Seek(-count, SeekOrigin.End);
                        r.Read(buf, 0, count);

                        var str = Encoding.ASCII.GetString(buf);
                        const string marker = "|HASHES|";
                        var i = str.LastIndexOf(marker, StringComparison.Ordinal);
                        if (i < 0)
                            throw new Exception("Hash data is missing from the installer. The .exe file most likely didn't finish downloading (or it got corrupted in some other way)");

                        var split = str.Substring(i + marker.Length);
                        hashes = split.Split(new char[] {'\n', '\r'}, StringSplitOptions.RemoveEmptyEntries)
                            .Select(x => x.ToLowerInvariant()).ToArray();

                        if (hashes.Length == 0)
                            throw new Exception("Hash data is missing from the installer. The .exe file most likely didn't finish downloading (or it got corrupted in some other way)");

                        r.Seek(0, SeekOrigin.Begin);

                        var hash = md5.ComputeHash(new Verifier.TrimmedStream(r, r.Length - (count - i)));
                        var niceHash = BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
                        if (niceHash != hashes[0])
                        {
                            throw new InvalidDataException(
                                $"File hash of file \"{Path.GetFileName(srcexe)}\" doesn't match - the file is most likely corrupted. Redownload this part and try again.\n\nExpected hash: \t{hashes[0]}\nActual hash: \t{niceHash}");
                        }
                    }


                    for (var i = 1; i < hashes.Length; i++)
                    {
                        var partPath = Path.Combine(thisPathDirectory.FullName, $"{thisName}-{i}.bin");

                        if (!File.Exists(partPath))
                            throw new InvalidDataException(
                                $"Could not find file \"{Path.GetFileName(partPath)}\". Make sure that all parts are downloaded to the same directory, and that all parts have their original names.");

                        try
                        {
                            //Text = $"{_verifyingIntegrityTitle} - {i}/{_partHashes.Length} done";

                            using (var stream = File.OpenRead(partPath))
                            {
                                var hash = md5.ComputeHash(stream);
                                var niceHash = BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
                                var expectedHash = hashes[i];
                                if (!expectedHash.Equals(niceHash, StringComparison.OrdinalIgnoreCase))
                                    throw new InvalidDataException(
                                        $"File hash of file \"{Path.GetFileName(partPath)}\" doesn't match - the file is most likely corrupted. Redownload this part and try again.\n\nExpected hash: \t{expectedHash}\nActual hash: \t{niceHash}");
                            }
                        }
                        catch (InvalidDataException)
                        {
                            throw;
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(
                                $"Failed to verify file {Path.GetFileName(partPath)}. Close other applications or restart your PC and try again.\n\nError: {ex}");
                        }
                    }
                }

                return "";
            }
            catch (Exception ex)
            {
                return 
                    "File verification failed, some of the HF Patch installation files are corrupted or missing. Make sure you downloaded all parts to the same folder, and redownload any corrupted parts.\n\n" +
                    ex.Message;
            }
        }

        // Used only in md5.ComputeHash which only needs Read to be implemented
        private class TrimmedStream : Stream
        {
            private readonly Stream _inner;
            private readonly long _size;

            public TrimmedStream(Stream inner, long size)
            {
                _inner = inner;
                _size = size;
            }
            public override void Flush()
            {
                throw new NotImplementedException();
            }

            public override long Seek(long offset, SeekOrigin origin)
            {
                throw new NotImplementedException();
            }

            public override void SetLength(long value)
            {
                throw new NotImplementedException();
            }

            private int GetAllowedCount(int count)
            {
                long pos = _inner.Position;
                long maxCount = _size - pos;
                if (count > maxCount)
                    count = (int)maxCount;
                return count;
            }

            public override int Read(byte[] buffer, int offset, int count)
            {
                count = GetAllowedCount(count);
                return _inner.Read(buffer, offset, count);
            }

            public override void Write(byte[] buffer, int offset, int count)
            {
                throw new NotImplementedException();
            }

            public override bool CanRead { get; }
            public override bool CanSeek { get; }
            public override bool CanWrite { get; }
            public override long Length { get; }
            public override long Position { get; set; }
        }
    }
}