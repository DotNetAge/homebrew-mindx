# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.21
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.21      → e.g. 2.2.0
#   v2.6.21          → e.g. v2.2.0
#   7922ff7564c700ee3f6aac6c1454d6df772f9db898601e3c29e98964cd448851 → SHA256 of darwin-amd64 tarball
#   bd8d1888170f10c58c402d0be1699d517d19412a1acfe8e441cf17c52dc78349 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.21"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.21/mindx-2.6.21-darwin-amd64.tar.gz"
      sha256 "7922ff7564c700ee3f6aac6c1454d6df772f9db898601e3c29e98964cd448851"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.21/mindx-2.6.21-darwin-arm64.tar.gz"
      sha256 "bd8d1888170f10c58c402d0be1699d517d19412a1acfe8e441cf17c52dc78349"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
