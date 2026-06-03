# kujirahand/crc32

This is a simple CRC32 implementation in MoonBit. It provides both a one-shot `checksum` function and a streaming `CRC32Stream` struct for incremental updates.

## Add to your project

To use this package in your MoonBit project, run:

```sh
moon add kujirahand/crc32
```

And import this package in your `moon.pkg`:

```moonbit
import {
    "kujirahand/crc32" @crc32
}
```

## Usage

Simply call the `checksum` function with your data:

```moonbit
fn main {
  println(@crc32.checksum(b"hello")) // 907060870
  println(@crc32.checksum(b"dog")) // 2167159165
}
```

For streaming updates, create a `CRC32Stream` and call `update` with new data:

```moonbit
fn main {
  // Stream example
  let mut stream = @crc32.CRC32Stream::new()
  stream = stream.update(b"hello")
  println(stream.finalize()) // 907060870
}

