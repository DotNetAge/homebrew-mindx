# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.0.9
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.0.9      → e.g. 2.2.0
#   v2.0.9          → e.g. v2.2.0
#   9031692aa8f5d7b79fba665a188e8d6eee3290d362a6e6e510094c268e49ae19 → SHA256 of darwin-amd64 tarball
#   e4104a2a115caecf8b1fd894f6a27c5759f80357c44f3a3c063c86927574dcf7 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.0.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.0.9/mindx-2.0.9-darwin-amd64.tar.gz"
      sha256 "9031692aa8f5d7b79fba665a188e8d6eee3290d362a6e6e510094c268e49ae19"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.0.9/mindx-2.0.9-darwin-arm64.tar.gz"
      sha256 "e4104a2a115caecf8b1fd894f6a27c5759f80357c44f3a3c063c86927574dcf7"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
