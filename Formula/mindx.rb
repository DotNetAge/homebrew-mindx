# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.0
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.0      → e.g. 2.2.0
#   v2.3.0          → e.g. v2.2.0
#   5842c45b6207abef0f71acab7f55a9a29f5441f4287c0fcef3e4d0d6c6d50a40 → SHA256 of darwin-amd64 tarball
#   19ca31d4db53b6b7541018786a48abb65df3cf42c177e9c1eca5045379fe1613 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.0/mindx-2.3.0-darwin-amd64.tar.gz"
      sha256 "5842c45b6207abef0f71acab7f55a9a29f5441f4287c0fcef3e4d0d6c6d50a40"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.0/mindx-2.3.0-darwin-arm64.tar.gz"
      sha256 "19ca31d4db53b6b7541018786a48abb65df3cf42c177e9c1eca5045379fe1613"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
