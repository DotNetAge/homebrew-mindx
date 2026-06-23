# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.0
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.0      → e.g. 2.2.0
#   v2.3.0          → e.g. v2.2.0
#   c7cf4638a4a6c291698491170bc6f4cf0a6243835c18518a534631ca308dd82b → SHA256 of darwin-amd64 tarball
#   ec922a18b7fde248e2fc69b421ede44962845d82774b72886212cf6ccc0ff220 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.0/mindx-2.3.0-darwin-amd64.tar.gz"
      sha256 "c7cf4638a4a6c291698491170bc6f4cf0a6243835c18518a534631ca308dd82b"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.0/mindx-2.3.0-darwin-arm64.tar.gz"
      sha256 "ec922a18b7fde248e2fc69b421ede44962845d82774b72886212cf6ccc0ff220"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
