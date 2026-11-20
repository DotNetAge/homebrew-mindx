# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.39
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.39      → e.g. 2.2.0
#   v2.6.39          → e.g. v2.2.0
#   fa10497aa81cbbf2896c33b7b6967ac15564ccd58c266289b1e52f42764a0342 → SHA256 of darwin-amd64 tarball
#   7c1e8b7918c80dc9b86a85474f1d6c6bc81923c8317f9ad0a53ddb9d5c548959 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.39"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.39/mindx-2.6.39-darwin-amd64.tar.gz"
      sha256 "fa10497aa81cbbf2896c33b7b6967ac15564ccd58c266289b1e52f42764a0342"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.39/mindx-2.6.39-darwin-arm64.tar.gz"
      sha256 "7c1e8b7918c80dc9b86a85474f1d6c6bc81923c8317f9ad0a53ddb9d5c548959"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
