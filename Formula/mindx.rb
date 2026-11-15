# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.27
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.27      → e.g. 2.2.0
#   v2.6.27          → e.g. v2.2.0
#   9f33e386353d733cbb4f5a47fc6d9b9f1f98447de0a196e67bf0d333da8db76a → SHA256 of darwin-amd64 tarball
#   461ad4c3fdaa79f2e4ce62fd60195db8d177f31de433a6772e4056a15dd05e4d → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.27"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.27/mindx-2.6.27-darwin-amd64.tar.gz"
      sha256 "9f33e386353d733cbb4f5a47fc6d9b9f1f98447de0a196e67bf0d333da8db76a"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.27/mindx-2.6.27-darwin-arm64.tar.gz"
      sha256 "461ad4c3fdaa79f2e4ce62fd60195db8d177f31de433a6772e4056a15dd05e4d"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
