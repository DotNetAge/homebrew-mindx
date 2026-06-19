# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.11
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.11      → e.g. 2.2.0
#   v2.2.11          → e.g. v2.2.0
#   fdd1c28ce457c767739f7f0bc9d817924f2f0cca82ca0aebdbe9a85a4c4fbdec → SHA256 of darwin-amd64 tarball
#   8c781b37ebc9fa0703cca181d00183dc6300640b7cb15cfceb491e3143f39154 → SHA256 of darwin-arm64 tarball
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
      sha256 "fdd1c28ce457c767739f7f0bc9d817924f2f0cca82ca0aebdbe9a85a4c4fbdec"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-arm64.tar.gz"
      sha256 "8c781b37ebc9fa0703cca181d00183dc6300640b7cb15cfceb491e3143f39154"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
