# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.46
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.46      → e.g. 2.2.0
#   v2.6.46          → e.g. v2.2.0
#   5c3f832897ee2fbc5f0724b24071c67c3b39daadfa4b4d6d67f9169f29600c16 → SHA256 of darwin-amd64 tarball
#   89feab86ca551fb865f225da5ef2db6091de1af8cbe97f7cbc775ea262617edf → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.46"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.46/mindx-2.6.46-darwin-amd64.tar.gz"
      sha256 "5c3f832897ee2fbc5f0724b24071c67c3b39daadfa4b4d6d67f9169f29600c16"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.46/mindx-2.6.46-darwin-arm64.tar.gz"
      sha256 "89feab86ca551fb865f225da5ef2db6091de1af8cbe97f7cbc775ea262617edf"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
