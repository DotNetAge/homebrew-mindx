# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.5.1
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.5.1      → e.g. 2.2.0
#   v2.5.1          → e.g. v2.2.0
#   995674f3a6d8c179a849556003f7fd2fcdc53e601c23b4ba1bb2fa1e6f866d82 → SHA256 of darwin-amd64 tarball
#   e221e637b0075b79e19ca9628ca589b407705988f6b22c937c171a2e4c7e0eb0 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.5.1"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.1/mindx-2.5.1-darwin-amd64.tar.gz"
      sha256 "995674f3a6d8c179a849556003f7fd2fcdc53e601c23b4ba1bb2fa1e6f866d82"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.1/mindx-2.5.1-darwin-arm64.tar.gz"
      sha256 "e221e637b0075b79e19ca9628ca589b407705988f6b22c937c171a2e4c7e0eb0"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
