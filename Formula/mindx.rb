# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.10
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.10      → e.g. 2.2.0
#   v2.3.10          → e.g. v2.2.0
#   761f53e01af653ad62e8e7a894fa424d9f0f9480563a07209818058a72d5bdce → SHA256 of darwin-amd64 tarball
#   8e5574f583c2d7d948fe7a7bfc6822f62c44a98dd99c0c4d7fdc74c5e47f6aed → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.10"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.10/mindx-2.3.10-darwin-amd64.tar.gz"
      sha256 "761f53e01af653ad62e8e7a894fa424d9f0f9480563a07209818058a72d5bdce"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.10/mindx-2.3.10-darwin-arm64.tar.gz"
      sha256 "8e5574f583c2d7d948fe7a7bfc6822f62c44a98dd99c0c4d7fdc74c5e47f6aed"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
