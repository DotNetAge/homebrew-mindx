# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.4
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.4      → e.g. 2.2.0
#   v2.2.4          → e.g. v2.2.0
#   ee034f06b34d20cd991081ece3f6205a74eed7d62a55c5c478d449022dede51e → SHA256 of darwin-amd64 tarball
#   1446fe66c76ca4542a4e749405ad7ab354c29e5530c49228bab865b28b046046 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.4/mindx-2.2.4-darwin-amd64.tar.gz"
      sha256 "ee034f06b34d20cd991081ece3f6205a74eed7d62a55c5c478d449022dede51e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.4/mindx-2.2.4-darwin-arm64.tar.gz"
      sha256 "1446fe66c76ca4542a4e749405ad7ab354c29e5530c49228bab865b28b046046"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
