# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.24
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.24      → e.g. 2.2.0
#   v2.6.24          → e.g. v2.2.0
#   7543b7f2c53a6ebc0b96168260dc0118b510e539844a73011c7bf2542c864e65 → SHA256 of darwin-amd64 tarball
#   fa0a8ae540be9ff956899fed109dd6050d18e9cd98c5b6db283b44b493ec665d → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.24"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.24/mindx-2.6.24-darwin-amd64.tar.gz"
      sha256 "7543b7f2c53a6ebc0b96168260dc0118b510e539844a73011c7bf2542c864e65"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.24/mindx-2.6.24-darwin-arm64.tar.gz"
      sha256 "fa0a8ae540be9ff956899fed109dd6050d18e9cd98c5b6db283b44b493ec665d"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
