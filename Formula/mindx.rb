# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.6
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.6      → e.g. 2.2.0
#   v2.2.6          → e.g. v2.2.0
#   31c6a7a3228536b4da47f700175aa1c2d3eae37a8916832e84718e8c593a2bb1 → SHA256 of darwin-amd64 tarball
#   73c90b835c9c5f3cfc2c5aae2f078bc4f14a5eec03c3608a33e7f22c605ea835 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.6/mindx-2.2.6-darwin-amd64.tar.gz"
      sha256 "31c6a7a3228536b4da47f700175aa1c2d3eae37a8916832e84718e8c593a2bb1"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.6/mindx-2.2.6-darwin-arm64.tar.gz"
      sha256 "73c90b835c9c5f3cfc2c5aae2f078bc4f14a5eec03c3608a33e7f22c605ea835"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
