# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.11
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.11      → e.g. 2.2.0
#   v2.2.11          → e.g. v2.2.0
#   7d6855f9ebcef0f4ec131df69c725eb31f565c6122f215488b5048c616cbedba → SHA256 of darwin-amd64 tarball
#   52e687c466b423e3fadd4b006334ec899262e3985906cccfde4d9978d52d3ac4 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-amd64.tar.gz"
      sha256 "7d6855f9ebcef0f4ec131df69c725eb31f565c6122f215488b5048c616cbedba"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-arm64.tar.gz"
      sha256 "52e687c466b423e3fadd4b006334ec899262e3985906cccfde4d9978d52d3ac4"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
