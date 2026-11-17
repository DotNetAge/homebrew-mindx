# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.32
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.32      → e.g. 2.2.0
#   v2.6.32          → e.g. v2.2.0
#   ff6216fd65cd40c8037fb747b387249f60690c6e0611111414c5ea65cce7c2c0 → SHA256 of darwin-amd64 tarball
#   0a8d713ed6e693d2592bb8c474be581ba31830299a0db5835e7685adba1613ce → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.32"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.32/mindx-2.6.32-darwin-amd64.tar.gz"
      sha256 "ff6216fd65cd40c8037fb747b387249f60690c6e0611111414c5ea65cce7c2c0"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.32/mindx-2.6.32-darwin-arm64.tar.gz"
      sha256 "0a8d713ed6e693d2592bb8c474be581ba31830299a0db5835e7685adba1613ce"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
