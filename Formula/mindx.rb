# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.21
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.21      → e.g. 2.2.0
#   v2.6.21          → e.g. v2.2.0
#   b1e3a10aad245a8b17044b6db441cdb3df23b2d29dc42107124d7381f096cbbe → SHA256 of darwin-amd64 tarball
#   f06fbb744f9df7bce8dfe491241e9527ae60369e323948c41844cc9d7ac4df29 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.21"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.21/mindx-2.6.21-darwin-amd64.tar.gz"
      sha256 "b1e3a10aad245a8b17044b6db441cdb3df23b2d29dc42107124d7381f096cbbe"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.21/mindx-2.6.21-darwin-arm64.tar.gz"
      sha256 "f06fbb744f9df7bce8dfe491241e9527ae60369e323948c41844cc9d7ac4df29"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
