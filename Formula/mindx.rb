# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.1.1
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.1.1      → e.g. 2.2.0
#   v2.1.1          → e.g. v2.2.0
#   fe83f676c0c6fced6311675906e4f37857d26cd08fff2587f1e40e9e7ae6f373 → SHA256 of darwin-amd64 tarball
#   a4faa33e35f23c412e89db9f4168f2e81a0d9cfcf9511f0d2134377b7ef35f73 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.1.1/mindx-2.1.1-darwin-amd64.tar.gz"
      sha256 "fe83f676c0c6fced6311675906e4f37857d26cd08fff2587f1e40e9e7ae6f373"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.1.1/mindx-2.1.1-darwin-arm64.tar.gz"
      sha256 "a4faa33e35f23c412e89db9f4168f2e81a0d9cfcf9511f0d2134377b7ef35f73"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
