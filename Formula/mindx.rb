# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.5.3
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.5.3      → e.g. 2.2.0
#   v2.5.3          → e.g. v2.2.0
#   a90653b6d3b7221258f472acacb4cf55690c7321f386705699fbcfaa7a5987d9 → SHA256 of darwin-amd64 tarball
#   78e94b33582b36208db26be415cd4e8fbca104619264902d1ab895c2a0df7e69 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.5.3"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.3/mindx-2.5.3-darwin-amd64.tar.gz"
      sha256 "a90653b6d3b7221258f472acacb4cf55690c7321f386705699fbcfaa7a5987d9"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.3/mindx-2.5.3-darwin-arm64.tar.gz"
      sha256 "78e94b33582b36208db26be415cd4e8fbca104619264902d1ab895c2a0df7e69"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
