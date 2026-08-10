# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.5.1
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.5.1      → e.g. 2.2.0
#   v2.5.1          → e.g. v2.2.0
#   d22e0d8a58b40700902550fb7dff7ef65d396ed8434f59535c585a261452eedc → SHA256 of darwin-amd64 tarball
#   32f198b2a5f16f8d983c703b614833b45db1f2845ccc7b9c2796ac2e98c2d39f → SHA256 of darwin-arm64 tarball
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
      sha256 "d22e0d8a58b40700902550fb7dff7ef65d396ed8434f59535c585a261452eedc"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.1/mindx-2.5.1-darwin-arm64.tar.gz"
      sha256 "32f198b2a5f16f8d983c703b614833b45db1f2845ccc7b9c2796ac2e98c2d39f"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
