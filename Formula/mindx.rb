# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.8
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.8      → e.g. 2.2.0
#   v2.3.8          → e.g. v2.2.0
#   cae34a2dfc60e10cc3d120f69fcc599f3d0321cc1280547382d06dd9de6d5ed8 → SHA256 of darwin-amd64 tarball
#   e5582bfd24b87eba7a7a8048bfe871a6f5fa918bc395629c27980db2f247d5f4 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.8"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.8/mindx-2.3.8-darwin-amd64.tar.gz"
      sha256 "cae34a2dfc60e10cc3d120f69fcc599f3d0321cc1280547382d06dd9de6d5ed8"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.8/mindx-2.3.8-darwin-arm64.tar.gz"
      sha256 "e5582bfd24b87eba7a7a8048bfe871a6f5fa918bc395629c27980db2f247d5f4"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
