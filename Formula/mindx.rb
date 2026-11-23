# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.44
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.44      → e.g. 2.2.0
#   v2.6.44          → e.g. v2.2.0
#   6d264a8978191503f3b843ba6109bad33f9acb145dada0b48af98ad7e9e8277a → SHA256 of darwin-amd64 tarball
#   8dd3c6ecab2c9a5e62176227d87f83a63e77d80aaa270b22ce9cc23e92881724 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.44"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.44/mindx-2.6.44-darwin-amd64.tar.gz"
      sha256 "6d264a8978191503f3b843ba6109bad33f9acb145dada0b48af98ad7e9e8277a"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.44/mindx-2.6.44-darwin-arm64.tar.gz"
      sha256 "8dd3c6ecab2c9a5e62176227d87f83a63e77d80aaa270b22ce9cc23e92881724"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
