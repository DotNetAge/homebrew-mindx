# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.4
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.4      → e.g. 2.2.0
#   v2.3.4          → e.g. v2.2.0
#   f35b0aafb43632dba4a3742bdaf9739edeffef4ce0a85d38876212f22b25afe6 → SHA256 of darwin-amd64 tarball
#   d1506c1959b2d61f2d7fc537e8d5cf4c5ea54afba22561285c9de72bb65b483e → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.4/mindx-2.3.4-darwin-amd64.tar.gz"
      sha256 "f35b0aafb43632dba4a3742bdaf9739edeffef4ce0a85d38876212f22b25afe6"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.4/mindx-2.3.4-darwin-arm64.tar.gz"
      sha256 "d1506c1959b2d61f2d7fc537e8d5cf4c5ea54afba22561285c9de72bb65b483e"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
