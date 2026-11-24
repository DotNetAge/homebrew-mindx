# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.48
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.48      → e.g. 2.2.0
#   v2.6.48          → e.g. v2.2.0
#   2101b3986599bde6f33d749334c7e4f4f0e279c1753c762bf0315ef954a4054e → SHA256 of darwin-amd64 tarball
#   8b7a81b6da4ef702f334b2b619f9fee97f9ad6a16743b0f220f5e196ba630b72 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.48"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.48/mindx-2.6.48-darwin-amd64.tar.gz"
      sha256 "2101b3986599bde6f33d749334c7e4f4f0e279c1753c762bf0315ef954a4054e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.48/mindx-2.6.48-darwin-arm64.tar.gz"
      sha256 "8b7a81b6da4ef702f334b2b619f9fee97f9ad6a16743b0f220f5e196ba630b72"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
