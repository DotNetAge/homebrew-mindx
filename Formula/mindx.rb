# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.13
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.13      → e.g. 2.2.0
#   v2.2.13          → e.g. v2.2.0
#   abbe3837ba72d91f5ee2212874d5c2ca3cd0e56151cd20c09a5095728037a1e4 → SHA256 of darwin-amd64 tarball
#   2aba0419e6a07adf614252825763a01367c5effd0729cd7caedad60ae7023eb7 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.13"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.13/mindx-2.2.13-darwin-amd64.tar.gz"
      sha256 "abbe3837ba72d91f5ee2212874d5c2ca3cd0e56151cd20c09a5095728037a1e4"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.13/mindx-2.2.13-darwin-arm64.tar.gz"
      sha256 "2aba0419e6a07adf614252825763a01367c5effd0729cd7caedad60ae7023eb7"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
