# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.37
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.37      → e.g. 2.2.0
#   v2.6.37          → e.g. v2.2.0
#   c7ffca58664479c8196a8398e02d4218ef818f55777192731b31c814792a3b84 → SHA256 of darwin-amd64 tarball
#   04f3cefca3262068d9f07273dc16dd4a565137290ae882d7ef2e4844a55577d0 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.37"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.37/mindx-2.6.37-darwin-amd64.tar.gz"
      sha256 "c7ffca58664479c8196a8398e02d4218ef818f55777192731b31c814792a3b84"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.37/mindx-2.6.37-darwin-arm64.tar.gz"
      sha256 "04f3cefca3262068d9f07273dc16dd4a565137290ae882d7ef2e4844a55577d0"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
