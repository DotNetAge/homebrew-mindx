# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.5
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.5      → e.g. 2.2.0
#   v2.2.5          → e.g. v2.2.0
#   94f0d0ab1b1593934ed11666ab78c6b7ebc2114aebd8e2d4ceda3f7e7d645aa1 → SHA256 of darwin-amd64 tarball
#   24f67571e8ad2432f2bc1ea930c5c6258d24cf71739dc21d08ce5019b0e3aa99 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.5/mindx-2.2.5-darwin-amd64.tar.gz"
      sha256 "94f0d0ab1b1593934ed11666ab78c6b7ebc2114aebd8e2d4ceda3f7e7d645aa1"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.5/mindx-2.2.5-darwin-arm64.tar.gz"
      sha256 "24f67571e8ad2432f2bc1ea930c5c6258d24cf71739dc21d08ce5019b0e3aa99"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
