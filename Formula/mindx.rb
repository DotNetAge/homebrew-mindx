# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.0
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.0      → e.g. 2.2.0
#   v2.3.0          → e.g. v2.2.0
#   3a01775a760d7a1e92cfabdc35aaf9708af7d7446d28cfcf7b79dc63e074c2a6 → SHA256 of darwin-amd64 tarball
#   3436690bd411ed37bbdaef8313826f2f21d1a44e28f5bbd694b6e4342b1cb3fd → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.0/mindx-2.3.0-darwin-amd64.tar.gz"
      sha256 "3a01775a760d7a1e92cfabdc35aaf9708af7d7446d28cfcf7b79dc63e074c2a6"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.0/mindx-2.3.0-darwin-arm64.tar.gz"
      sha256 "3436690bd411ed37bbdaef8313826f2f21d1a44e28f5bbd694b6e4342b1cb3fd"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
