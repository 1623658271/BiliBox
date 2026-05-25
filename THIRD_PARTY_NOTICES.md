# Third-Party Notices

## FFmpeg and FFprobe

Release builds of Bilibili Box include `ffmpeg` and `ffprobe` as separate executable tools in the `env/` directory. Bilibili Box invokes these tools as external processes for media merging and conversion; they are not linked into the Rust executable.

The packaged FFmpeg tools are built with GPL-enabled features and are distributed under the applicable FFmpeg and linked-library licenses. The MIT license for Bilibili Box does not replace the licenses of these bundled tools.

Runtime sources used by the GitHub Release workflow:

- Windows x64: [gyan.dev FFmpeg Builds](https://www.gyan.dev/ffmpeg/builds/), FFmpeg 8.1.1 GPLv3 static essentials archive.
- Linux x64: [BtbN/FFmpeg-Builds](https://github.com/BtbN/FFmpeg-Builds), FFmpeg 7.1 GPL static archive.
- macOS x64 and arm64: [Martin Riedl's FFmpeg Build Server](https://ffmpeg.martin-riedl.de/), FFmpeg 8.1.1 static release executables.

FFmpeg source code and licensing information are available from:

- [FFmpeg project](https://ffmpeg.org/)
- [FFmpeg legal information](https://ffmpeg.org/legal.html)
- [FFmpeg source downloads](https://ffmpeg.org/download.html#get-sources)

Users may replace the bundled executables with compatible `ffmpeg` and `ffprobe` builds in the application `env/` directory.
