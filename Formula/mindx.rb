# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.5.4
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.5.4      → e.g. 2.2.0
#   v2.5.4          → e.g. v2.2.0
#   a3c000360619ae61b7c53cd84eb2aeef2992d88a89b052020a318f50806195b0 → SHA256 of darwin-amd64 tarball
#   bc335faf60cbfc9a232d337155d8eebc01e8b037c0f144aefe60bf824435263e → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.5.4"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.4/mindx-2.5.4-darwin-amd64.tar.gz"
      sha256 "a3c000360619ae61b7c53cd84eb2aeef2992d88a89b052020a318f50806195b0"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.4/mindx-2.5.4-darwin-arm64.tar.gz"
      sha256 "bc335faf60cbfc9a232d337155d8eebc01e8b037c0f144aefe60bf824435263e"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
