# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.40
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.40      → e.g. 2.2.0
#   v2.6.40          → e.g. v2.2.0
#   398689d774c0a3874076e0fc82162189c3f69d4b54897b180bb6e01a2c32e0a1 → SHA256 of darwin-amd64 tarball
#   7434ab57abd8a80362b672260e11a8cc59bdb7835917caf2773bd000bbc9fdc7 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.40"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.40/mindx-2.6.40-darwin-amd64.tar.gz"
      sha256 "398689d774c0a3874076e0fc82162189c3f69d4b54897b180bb6e01a2c32e0a1"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.40/mindx-2.6.40-darwin-arm64.tar.gz"
      sha256 "7434ab57abd8a80362b672260e11a8cc59bdb7835917caf2773bd000bbc9fdc7"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
