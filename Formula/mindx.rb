# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.12
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.12      → e.g. 2.2.0
#   v2.2.12          → e.g. v2.2.0
#   f2256cb6c74a92a2c2a722be422e8b85d2580b2b9c6daf090b79a744077efeaa → SHA256 of darwin-amd64 tarball
#   aad10731c20768a615ed261d6adb728d5540107006f7163ef9ec45fd5d04f214 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.12/mindx-2.2.12-darwin-amd64.tar.gz"
      sha256 "f2256cb6c74a92a2c2a722be422e8b85d2580b2b9c6daf090b79a744077efeaa"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.12/mindx-2.2.12-darwin-arm64.tar.gz"
      sha256 "aad10731c20768a615ed261d6adb728d5540107006f7163ef9ec45fd5d04f214"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
