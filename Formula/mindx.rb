# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.28
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.28      → e.g. 2.2.0
#   v2.6.28          → e.g. v2.2.0
#   d892bb1b84e8e2a51f96a1a4cdb2e6ced4f31184dfb3387c4b303d774cd9c940 → SHA256 of darwin-amd64 tarball
#   6f7d699cde4a9e58827525f32786c6c3af69a5da5e98729e60d3e1c01baa7491 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.28"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.28/mindx-2.6.28-darwin-amd64.tar.gz"
      sha256 "d892bb1b84e8e2a51f96a1a4cdb2e6ced4f31184dfb3387c4b303d774cd9c940"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.28/mindx-2.6.28-darwin-arm64.tar.gz"
      sha256 "6f7d699cde4a9e58827525f32786c6c3af69a5da5e98729e60d3e1c01baa7491"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
