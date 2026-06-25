# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.2
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.2      → e.g. 2.2.0
#   v2.3.2          → e.g. v2.2.0
#   0bbfd01b2fd019ee90327485bf70b1101bf5e9bc78b830da31a3f6747c1fbef3 → SHA256 of darwin-amd64 tarball
#   07d7052a6b44e8eee26cdf0afb27217826111ef505006793329442e09664e8f8 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.2/mindx-2.3.2-darwin-amd64.tar.gz"
      sha256 "0bbfd01b2fd019ee90327485bf70b1101bf5e9bc78b830da31a3f6747c1fbef3"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.2/mindx-2.3.2-darwin-arm64.tar.gz"
      sha256 "07d7052a6b44e8eee26cdf0afb27217826111ef505006793329442e09664e8f8"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
