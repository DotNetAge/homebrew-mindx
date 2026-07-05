# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.16
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.16      → e.g. 2.2.0
#   v2.3.16          → e.g. v2.2.0
#   8101cddba3a68561ebbae03e784dffa685f7a35c2b5dea32803e619ab61daa79 → SHA256 of darwin-amd64 tarball
#   3ccb54820421044f1ea2cb0a8119538dd3795d6e03e35f8096a4ae6c3ecf8208 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.16"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.16/mindx-2.3.16-darwin-amd64.tar.gz"
      sha256 "8101cddba3a68561ebbae03e784dffa685f7a35c2b5dea32803e619ab61daa79"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.16/mindx-2.3.16-darwin-arm64.tar.gz"
      sha256 "3ccb54820421044f1ea2cb0a8119538dd3795d6e03e35f8096a4ae6c3ecf8208"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
