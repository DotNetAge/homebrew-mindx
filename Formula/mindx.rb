# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.17
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.17      → e.g. 2.2.0
#   v2.3.17          → e.g. v2.2.0
#   c900831a5f86a316124761c7bceae71d9c72bea2baad64e7d7d5d1f895b8bf20 → SHA256 of darwin-amd64 tarball
#   018b1efafed8c05a5070ac0129f02c518d171f5d22c152eac7e80df891050923 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.17"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.17/mindx-2.3.17-darwin-amd64.tar.gz"
      sha256 "c900831a5f86a316124761c7bceae71d9c72bea2baad64e7d7d5d1f895b8bf20"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.17/mindx-2.3.17-darwin-arm64.tar.gz"
      sha256 "018b1efafed8c05a5070ac0129f02c518d171f5d22c152eac7e80df891050923"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
