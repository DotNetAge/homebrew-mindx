# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.26
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.26      → e.g. 2.2.0
#   v2.6.26          → e.g. v2.2.0
#   167e38c537c482ab0ad18d5ff6163e25b4db3073e7ac6a62e54e7ce993f322b5 → SHA256 of darwin-amd64 tarball
#   d95d99a8fea0e73675b93fca7e060aedfc73f08efb3a120f4fe9cc1190c8b7bc → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.26"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.26/mindx-2.6.26-darwin-amd64.tar.gz"
      sha256 "167e38c537c482ab0ad18d5ff6163e25b4db3073e7ac6a62e54e7ce993f322b5"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.26/mindx-2.6.26-darwin-arm64.tar.gz"
      sha256 "d95d99a8fea0e73675b93fca7e060aedfc73f08efb3a120f4fe9cc1190c8b7bc"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
