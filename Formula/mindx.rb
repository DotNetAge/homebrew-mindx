# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.9
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.9      → e.g. 2.2.0
#   v2.2.9          → e.g. v2.2.0
#   f8b0ad67920de091389289e8e62f5afcceb4f9b2b95149777614bf539d95bd5e → SHA256 of darwin-amd64 tarball
#   7f7fa515d64b795c95ba5061e44d793ede504a60c9ae2e5ff41c260472b0b122 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.9/mindx-2.2.9-darwin-amd64.tar.gz"
      sha256 "f8b0ad67920de091389289e8e62f5afcceb4f9b2b95149777614bf539d95bd5e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.9/mindx-2.2.9-darwin-arm64.tar.gz"
      sha256 "7f7fa515d64b795c95ba5061e44d793ede504a60c9ae2e5ff41c260472b0b122"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
