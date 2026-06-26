# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.5
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.5      → e.g. 2.2.0
#   v2.3.5          → e.g. v2.2.0
#   75184f3a3c018a7842f84b933da3e2de54c31ff1eed6826108fd3651ab122997 → SHA256 of darwin-amd64 tarball
#   313d9fd91bdb7dea39dd72b8dad3052d4b5e19b5400685887fcf558a2b8b63b4 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.5/mindx-2.3.5-darwin-amd64.tar.gz"
      sha256 "75184f3a3c018a7842f84b933da3e2de54c31ff1eed6826108fd3651ab122997"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.5/mindx-2.3.5-darwin-arm64.tar.gz"
      sha256 "313d9fd91bdb7dea39dd72b8dad3052d4b5e19b5400685887fcf558a2b8b63b4"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
