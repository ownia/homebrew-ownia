class Parallax < Formula
  desc "Native macOS screen translation app using Apple Vision OCR"
  homepage "https://github.com/ownia/Parallax"
  url "https://github.com/ownia/Parallax/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "495b48ffebfbd86b7d325489e7865f895d9f608349ea137bcc08f859a56c4cde"
  license "GPL-3.0-or-later"
  head "https://github.com/ownia/Parallax.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "Scripts/generate_icon.swift"

    xcodebuild "-project", "Parallax.xcodeproj",
           "-scheme", "Parallax",
           "-configuration", "Release",
           "-derivedDataPath", "build",
           "SYMROOT=build",
           "CONFIGURATION_BUILD_DIR=build/Release",
           "CODE_SIGN_IDENTITY=-",
           "CODE_SIGNING_REQUIRED=NO",
           "CODE_SIGNING_ALLOWED=NO"

    prefix.install "build/Release/Parallax.app"

    (bin/"parallax").write <<~EOS
      #!/bin/bash
      open "#{prefix}/Parallax.app"
    EOS
  end

  def caveats
    <<~EOS
      Parallax has been installed to:
        #{prefix}/Parallax.app

      To use Parallax:
        1. Run: parallax (or open from Applications)
        2. Grant screen recording permission:
           System Settings → Privacy & Security → Screen Recording
        3. Enable Parallax and restart the app

      Usage:
        - Press Ctrl+Shift+T to trigger screen translation
        - Click the menu bar icon for settings

      For offline translation (macOS 15+):
        - Download language packs from:
          System Settings → General → Language & Region → Translation Languages
    EOS
  end

  test do
    assert_path_exists prefix/"Parallax.app/Contents/MacOS/Parallax"
  end
end
