# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.30
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.30      → e.g. 2.2.0
#   v2.6.30          → e.g. v2.2.0
#   2b0da31116f65a6eebfe26fe77896c34b0ddab379c81c88a7d351d476092a068 → SHA256 of darwin-amd64 tarball
#   9661dd20abb6eeaf429a0f077ee94f3fccae404747c70279eaac05df8d9fe8fc → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.30"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.30/mindx-2.6.30-darwin-amd64.tar.gz"
      sha256 "2b0da31116f65a6eebfe26fe77896c34b0ddab379c81c88a7d351d476092a068"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.30/mindx-2.6.30-darwin-arm64.tar.gz"
      sha256 "9661dd20abb6eeaf429a0f077ee94f3fccae404747c70279eaac05df8d9fe8fc"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
