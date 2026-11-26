# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.49
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.49      → e.g. 2.2.0
#   v2.6.49          → e.g. v2.2.0
#   563f114b465d0c0931f0ffca53d46344929ed8f063230783373b856104d768e9 → SHA256 of darwin-amd64 tarball
#   be49f26085817ca6a9e6e68e2ad51489603d8542d9ec55f5bc5e21a26e8fd935 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.49"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.49/mindx-2.6.49-darwin-amd64.tar.gz"
      sha256 "563f114b465d0c0931f0ffca53d46344929ed8f063230783373b856104d768e9"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.49/mindx-2.6.49-darwin-arm64.tar.gz"
      sha256 "be49f26085817ca6a9e6e68e2ad51489603d8542d9ec55f5bc5e21a26e8fd935"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
