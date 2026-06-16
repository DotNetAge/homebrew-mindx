# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.2
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.2      → e.g. 2.2.0
#   v2.2.2          → e.g. v2.2.0
#   1a109acbe18fa253dc6038512eb5be563c0a3917204c170f3278749536fe7dfc → SHA256 of darwin-amd64 tarball
#   d47e1877955f76714508248d3cf4ecd03b078f2ee983d1c9db75a40dcf2766e7 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.2/mindx-2.2.2-darwin-amd64.tar.gz"
      sha256 "1a109acbe18fa253dc6038512eb5be563c0a3917204c170f3278749536fe7dfc"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.2/mindx-2.2.2-darwin-arm64.tar.gz"
      sha256 "d47e1877955f76714508248d3cf4ecd03b078f2ee983d1c9db75a40dcf2766e7"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
