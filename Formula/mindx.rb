# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.0.7
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.0.7      → e.g. 2.2.0
#   v2.0.7          → e.g. v2.2.0
#   a07572670f765f77171c135e839da9652534df2bee80df6f01b721958834302e → SHA256 of darwin-amd64 tarball
#   0d785342849293414b3534047b5757c59e25ca6b1b0afe6287511cdae05b2c7b → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.0.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.0.7/mindx-2.0.7-darwin-amd64.tar.gz"
      sha256 "a07572670f765f77171c135e839da9652534df2bee80df6f01b721958834302e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.0.7/mindx-2.0.7-darwin-arm64.tar.gz"
      sha256 "0d785342849293414b3534047b5757c59e25ca6b1b0afe6287511cdae05b2c7b"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
