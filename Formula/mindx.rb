# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.3
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.3      → e.g. 2.2.0
#   v2.6.3          → e.g. v2.2.0
#    → SHA256 of darwin-amd64 tarball
#    → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.3/mindx-2.6.3-darwin-amd64.tar.gz"
      sha256 ""
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.3/mindx-2.6.3-darwin-arm64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
