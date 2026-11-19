# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.35
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.35      → e.g. 2.2.0
#   v2.6.35          → e.g. v2.2.0
#   9cdd9e2da4df4ad336b4754fa4db54dc7cb7319bcfa9bae8a16ef1f678addfce → SHA256 of darwin-amd64 tarball
#   6865a747ad02a22c4b87773c2c6a2a9d1000803e64124d5b0bdaae0e4083a7f0 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.35"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.35/mindx-2.6.35-darwin-amd64.tar.gz"
      sha256 "9cdd9e2da4df4ad336b4754fa4db54dc7cb7319bcfa9bae8a16ef1f678addfce"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.35/mindx-2.6.35-darwin-arm64.tar.gz"
      sha256 "6865a747ad02a22c4b87773c2c6a2a9d1000803e64124d5b0bdaae0e4083a7f0"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
