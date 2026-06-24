# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.1
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.1      → e.g. 2.2.0
#   v2.3.1          → e.g. v2.2.0
#   e5ca3a1f602cc9730f0bca1d2ae17435e92ba24b9112d5c870ef22edbec29fa5 → SHA256 of darwin-amd64 tarball
#   83e55c53d7c629a3e49d07b91cde98c3e18450db0c6970d8e68ad8a8f8743079 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.1/mindx-2.3.1-darwin-amd64.tar.gz"
      sha256 "e5ca3a1f602cc9730f0bca1d2ae17435e92ba24b9112d5c870ef22edbec29fa5"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.1/mindx-2.3.1-darwin-arm64.tar.gz"
      sha256 "83e55c53d7c629a3e49d07b91cde98c3e18450db0c6970d8e68ad8a8f8743079"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
