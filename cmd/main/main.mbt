///|
fn main {
  // Basic checksum example
  println(@crc32.checksum(b"hello")) // 907060870
  println(@crc32.checksum(b"dog")) // 2167159165
  // Stream example
  let mut stream = @crc32.CRC32Stream::new()
  stream = stream.update(b"hello")
  println(stream.finalize()) // 907060870
}
