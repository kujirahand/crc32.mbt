///|
// CRC32 checksum implementation
test "CRC32 simple test" {
  let bytes = b"The quick brown fox jumps over the lazy dog"
  let expected_crc32 : UInt = 0x414FA339
  let computed_crc32 : UInt = checksum(bytes)
  assert_eq(expected_crc32, computed_crc32)
}

///|
test "CRC32 empty string test" {
  let tests = [
    (b"", 0x00000000),
    (b"hello", 0x3610A686),
    (b"cat", 0x9E5E43A8),
    (b"dog", 0x812C397D),
    (b"This is a pen.", 0x3BCADC93),
  ]
  for t in tests {
    let (input, expected) = t
    let computed = checksum(input)
    let input_str = input.to_string()
    let msg = "CRC32 checksum of '\{input_str}' should be \{expected}, got \{computed}"
    assert_eq(expected.reinterpret_as_uint(), computed, msg~)
  }
}

///|
test "CRC32 stream test" {
  let input = b"The quick brown fox jumps over the lazy dog"
  let expected_crc32 : UInt = 0x414FA339
  let mut stream = CRC32Stream::new()
  stream = stream.update(input)
  let computed_crc32 = stream.finalize()
  assert_eq(expected_crc32, computed_crc32)
}
