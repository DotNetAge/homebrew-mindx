# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.11
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.11      → e.g. 2.2.0
#   v2.2.11          → e.g. v2.2.0
#   f38743c144824896490c2a853121cfce8d63a545d3435a96eb03941efd143026 → SHA256 of darwin-amd64 tarball
#   b368bbfc342d018e63dd048a1bdfbaeaae8de6e697261ee1c0cc837d7a355f78 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-amd64.tar.gz"
      sha256 "f38743c144824896490c2a853121cfce8d63a545d3435a96eb03941efd143026"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-arm64.tar.gz"
      sha256 "b368bbfc342d018e63dd048a1bdfbaeaae8de6e697261ee1c0cc837d7a355f78"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
