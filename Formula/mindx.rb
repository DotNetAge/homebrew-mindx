# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.9
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.9      → e.g. 2.2.0
#   v2.3.9          → e.g. v2.2.0
#   a1646386ad9f85514bc7ad9720ab3dc95e881136b45234eacbdebe58b11cbeb0 → SHA256 of darwin-amd64 tarball
#   290f42b986645730b6281e4dd729ae49d8642aaa82ace0e185b0325c0a282708 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.9"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.9/mindx-2.3.9-darwin-amd64.tar.gz"
      sha256 "a1646386ad9f85514bc7ad9720ab3dc95e881136b45234eacbdebe58b11cbeb0"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.9/mindx-2.3.9-darwin-arm64.tar.gz"
      sha256 "290f42b986645730b6281e4dd729ae49d8642aaa82ace0e185b0325c0a282708"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
