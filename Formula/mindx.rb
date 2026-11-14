# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.25
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.25      → e.g. 2.2.0
#   v2.6.25          → e.g. v2.2.0
#   f87bf70e9b1419c1f592b82c4b811c1045d98b64aee9bf59bfbc1220b8363e2b → SHA256 of darwin-amd64 tarball
#   50a0cc72665df06e59315a521ee5873a4e171e824648dd881b011d455de060ef → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.25"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.25/mindx-2.6.25-darwin-amd64.tar.gz"
      sha256 "f87bf70e9b1419c1f592b82c4b811c1045d98b64aee9bf59bfbc1220b8363e2b"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.25/mindx-2.6.25-darwin-arm64.tar.gz"
      sha256 "50a0cc72665df06e59315a521ee5873a4e171e824648dd881b011d455de060ef"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
