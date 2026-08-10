# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.5.1
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.5.1      → e.g. 2.2.0
#   v2.5.1          → e.g. v2.2.0
#   1cf3b028bca2ddc8534736d3d65e7f9c4857619806edb05559252ee2dbc24957 → SHA256 of darwin-amd64 tarball
#   7f1e41ed8423cbef441475f11ee764d02763336ca24b54d30d382d8b19f412a4 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.5.1"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.1/mindx-2.5.1-darwin-amd64.tar.gz"
      sha256 "1cf3b028bca2ddc8534736d3d65e7f9c4857619806edb05559252ee2dbc24957"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.1/mindx-2.5.1-darwin-arm64.tar.gz"
      sha256 "7f1e41ed8423cbef441475f11ee764d02763336ca24b54d30d382d8b19f412a4"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
