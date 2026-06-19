# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.11
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.11      → e.g. 2.2.0
#   v2.2.11          → e.g. v2.2.0
#   dd5484b0c9c3fd574fc1f80cda480894f470869cab20c50981f47112ffa30137 → SHA256 of darwin-amd64 tarball
#   350af495a2267184fe5b8522087f1ad1c2ec9d2c9b03b0024decba6ae6b67934 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-amd64.tar.gz"
      sha256 "dd5484b0c9c3fd574fc1f80cda480894f470869cab20c50981f47112ffa30137"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.11/mindx-2.2.11-darwin-arm64.tar.gz"
      sha256 "350af495a2267184fe5b8522087f1ad1c2ec9d2c9b03b0024decba6ae6b67934"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
