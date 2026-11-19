# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.36
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.36      → e.g. 2.2.0
#   v2.6.36          → e.g. v2.2.0
#   4be7f23f6fde86685cbd2c9db02cfb145879534b5f38240333fa483d2432d41d → SHA256 of darwin-amd64 tarball
#   621a6bfbe48e40e4b09fbd4a538144f78e9b83b66fcb06a4a5477b5dbbb155c8 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.36"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.36/mindx-2.6.36-darwin-amd64.tar.gz"
      sha256 "4be7f23f6fde86685cbd2c9db02cfb145879534b5f38240333fa483d2432d41d"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.36/mindx-2.6.36-darwin-arm64.tar.gz"
      sha256 "621a6bfbe48e40e4b09fbd4a538144f78e9b83b66fcb06a4a5477b5dbbb155c8"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
