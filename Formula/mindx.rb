# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.50
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.50      → e.g. 2.2.0
#   v2.6.50          → e.g. v2.2.0
#   537d48462e3168845c1c96971e7dd789a9ef963f72d2aafe116b9df7fa64ec94 → SHA256 of darwin-amd64 tarball
#   86cab7ecb08682c4896e527bbc8201335835a7e0692daaf1ddfc4759bd36e8ad → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.50"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.50/mindx-2.6.50-darwin-amd64.tar.gz"
      sha256 "537d48462e3168845c1c96971e7dd789a9ef963f72d2aafe116b9df7fa64ec94"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.50/mindx-2.6.50-darwin-arm64.tar.gz"
      sha256 "86cab7ecb08682c4896e527bbc8201335835a7e0692daaf1ddfc4759bd36e8ad"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
