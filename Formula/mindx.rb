# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.12
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.12      → e.g. 2.2.0
#   v2.3.12          → e.g. v2.2.0
#   1f6f86d35489e68246ffdfb39254187df2e5b081f1fba8fb30d4170f7b0afeb2 → SHA256 of darwin-amd64 tarball
#   e2b2d3afb589285422df9b56d4845f87817e1a6d37dc088f43fcc8adf06ba6a5 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.12"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.12/mindx-2.3.12-darwin-amd64.tar.gz"
      sha256 "1f6f86d35489e68246ffdfb39254187df2e5b081f1fba8fb30d4170f7b0afeb2"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.12/mindx-2.3.12-darwin-arm64.tar.gz"
      sha256 "e2b2d3afb589285422df9b56d4845f87817e1a6d37dc088f43fcc8adf06ba6a5"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
