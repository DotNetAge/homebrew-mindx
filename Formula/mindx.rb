# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.5.9
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.5.9      → e.g. 2.2.0
#   v2.5.9          → e.g. v2.2.0
#   8d641063d5be6951865bbc739ebcfeef75556bc15a4209a2ead277ee706c8c4c → SHA256 of darwin-amd64 tarball
#   130f6f65448e3d00618588b45efd030319f1a0530b2858deaec6846ba56f2a1b → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.5.9"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.9/mindx-2.5.9-darwin-amd64.tar.gz"
      sha256 "8d641063d5be6951865bbc739ebcfeef75556bc15a4209a2ead277ee706c8c4c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.9/mindx-2.5.9-darwin-arm64.tar.gz"
      sha256 "130f6f65448e3d00618588b45efd030319f1a0530b2858deaec6846ba56f2a1b"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
