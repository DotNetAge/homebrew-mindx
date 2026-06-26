# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.6
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.6      → e.g. 2.2.0
#   v2.3.6          → e.g. v2.2.0
#   b203fab4068ae598dadefc322004aee612996a117798f1c7d73b94d35cb15291 → SHA256 of darwin-amd64 tarball
#   85e3760c3a8076fe71ee1572cf199ce6f3e5222f49d61fe00f1ec8f2b362965a → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.6"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.6/mindx-2.3.6-darwin-amd64.tar.gz"
      sha256 "b203fab4068ae598dadefc322004aee612996a117798f1c7d73b94d35cb15291"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.6/mindx-2.3.6-darwin-arm64.tar.gz"
      sha256 "85e3760c3a8076fe71ee1572cf199ce6f3e5222f49d61fe00f1ec8f2b362965a"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
