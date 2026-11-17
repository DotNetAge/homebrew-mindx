# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.31
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.31      → e.g. 2.2.0
#   v2.6.31          → e.g. v2.2.0
#   cbb556c1e54689ca87d7acdd9d96e95dc349795fedd84d765acd2f604b728813 → SHA256 of darwin-amd64 tarball
#   d4e51afaa144bcdbba2862dcba17b123d54639b7bb11b8e19b6a150ae2777052 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.31"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.31/mindx-2.6.31-darwin-amd64.tar.gz"
      sha256 "cbb556c1e54689ca87d7acdd9d96e95dc349795fedd84d765acd2f604b728813"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.31/mindx-2.6.31-darwin-arm64.tar.gz"
      sha256 "d4e51afaa144bcdbba2862dcba17b123d54639b7bb11b8e19b6a150ae2777052"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
