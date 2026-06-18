# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.10
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.10      → e.g. 2.2.0
#   v2.2.10          → e.g. v2.2.0
#   bd9ee2703cee00cf073b1b17b23e9becf4dc11b1ba47d6ac384348be7b219611 → SHA256 of darwin-amd64 tarball
#   cfae65d9cc127de9c29e9eedc748ae3ad02f68030c09539d5c31cf6bc8e73bd7 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.10/mindx-2.2.10-darwin-amd64.tar.gz"
      sha256 "bd9ee2703cee00cf073b1b17b23e9becf4dc11b1ba47d6ac384348be7b219611"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.10/mindx-2.2.10-darwin-arm64.tar.gz"
      sha256 "cfae65d9cc127de9c29e9eedc748ae3ad02f68030c09539d5c31cf6bc8e73bd7"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
