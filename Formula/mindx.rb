# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.13
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.13      → e.g. 2.2.0
#   v2.3.13          → e.g. v2.2.0
#   934e29f3544ea04ebb2fb979ca47b99de9f5c16974be4c3a8587bf279e782784 → SHA256 of darwin-amd64 tarball
#   9e2d40f142635a9ffc4fcb1e7d18d4cf10f500fc27184f1c55891e1f56167182 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.13"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.13/mindx-2.3.13-darwin-amd64.tar.gz"
      sha256 "934e29f3544ea04ebb2fb979ca47b99de9f5c16974be4c3a8587bf279e782784"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.13/mindx-2.3.13-darwin-arm64.tar.gz"
      sha256 "9e2d40f142635a9ffc4fcb1e7d18d4cf10f500fc27184f1c55891e1f56167182"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
