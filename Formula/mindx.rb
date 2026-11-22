# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.41
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.41      → e.g. 2.2.0
#   v2.6.41          → e.g. v2.2.0
#   fe772ca0ea17a108c69072f7e4bf3263a61da5e9934a1e1c59f7fcbaa7cd0ce6 → SHA256 of darwin-amd64 tarball
#   4356f1b33de81b566a38d97df9a9abde43688e962b07f6abaafc270da59aab8e → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.41"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.41/mindx-2.6.41-darwin-amd64.tar.gz"
      sha256 "fe772ca0ea17a108c69072f7e4bf3263a61da5e9934a1e1c59f7fcbaa7cd0ce6"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.41/mindx-2.6.41-darwin-arm64.tar.gz"
      sha256 "4356f1b33de81b566a38d97df9a9abde43688e962b07f6abaafc270da59aab8e"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
