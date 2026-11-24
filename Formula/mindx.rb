# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.47
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.47      → e.g. 2.2.0
#   v2.6.47          → e.g. v2.2.0
#   732461ec884d86dca9e7d180ad6c44ec8e2a8a2fcb3c863b70bdd1408a05abf8 → SHA256 of darwin-amd64 tarball
#   2cf624f87ac8c5a8aa899b4a17c6ebb46ef0159f485d14578297f55d24f14c31 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.47"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.47/mindx-2.6.47-darwin-amd64.tar.gz"
      sha256 "732461ec884d86dca9e7d180ad6c44ec8e2a8a2fcb3c863b70bdd1408a05abf8"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.47/mindx-2.6.47-darwin-arm64.tar.gz"
      sha256 "2cf624f87ac8c5a8aa899b4a17c6ebb46ef0159f485d14578297f55d24f14c31"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
