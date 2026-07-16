# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.4.9
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.4.9      → e.g. 2.2.0
#   v2.4.9          → e.g. v2.2.0
#   d9141d7e8739f76e5197de574e31532b6034421b9a833ee61a97d76c6c9c3f1b → SHA256 of darwin-amd64 tarball
#   89cbd0939b33517a2bd6a661615882e34e6b6b634c3b097a4d03dc83f63d6bfc → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.4.9"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.4.9/mindx-2.4.9-darwin-amd64.tar.gz"
      sha256 "d9141d7e8739f76e5197de574e31532b6034421b9a833ee61a97d76c6c9c3f1b"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.4.9/mindx-2.4.9-darwin-arm64.tar.gz"
      sha256 "89cbd0939b33517a2bd6a661615882e34e6b6b634c3b097a4d03dc83f63d6bfc"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
