# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.3
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.3      → e.g. 2.2.0
#   v2.3.3          → e.g. v2.2.0
#   66c9907e1fb12f0c5eb1f6acc86885b2338c0771f4cec5294ef338d5e47022c4 → SHA256 of darwin-amd64 tarball
#   d4aab6257c3d23c0f8509152bed0faf87b66ada57457823765697ada0f7dc948 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.3/mindx-2.3.3-darwin-amd64.tar.gz"
      sha256 "66c9907e1fb12f0c5eb1f6acc86885b2338c0771f4cec5294ef338d5e47022c4"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.3/mindx-2.3.3-darwin-arm64.tar.gz"
      sha256 "d4aab6257c3d23c0f8509152bed0faf87b66ada57457823765697ada0f7dc948"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
