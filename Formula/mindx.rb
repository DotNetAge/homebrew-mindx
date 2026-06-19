# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.11
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.11      → e.g. 2.2.0
#   v2.2.11          → e.g. v2.2.0
#   4ce8cfd1370b3d3331f827ebea066d0ad58ebc5103eb84b394c65b4c20f6e9e4 → SHA256 of darwin-amd64 tarball
#   9489c53a6933d57c5347caa46145740f0ecd517c0fd3f27bfbdfede772653c83 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-amd64.tar.gz"
      sha256 "4ce8cfd1370b3d3331f827ebea066d0ad58ebc5103eb84b394c65b4c20f6e9e4"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-arm64.tar.gz"
      sha256 "9489c53a6933d57c5347caa46145740f0ecd517c0fd3f27bfbdfede772653c83"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
