# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.19
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.19      → e.g. 2.2.0
#   v2.3.19          → e.g. v2.2.0
#   78630f45ca7e3c62733d1849501bfd2a9d2618f964fdba474d5336088bcc2879 → SHA256 of darwin-amd64 tarball
#   d8eb5613af3373ae879842001cefc2c4d5d1ad61171bcd9ea7afa70e664a81a7 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.19"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.19/mindx-2.3.19-darwin-amd64.tar.gz"
      sha256 "78630f45ca7e3c62733d1849501bfd2a9d2618f964fdba474d5336088bcc2879"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.19/mindx-2.3.19-darwin-arm64.tar.gz"
      sha256 "d8eb5613af3373ae879842001cefc2c4d5d1ad61171bcd9ea7afa70e664a81a7"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
