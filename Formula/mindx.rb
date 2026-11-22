# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.43
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.43      → e.g. 2.2.0
#   v2.6.43          → e.g. v2.2.0
#   83eb82d3e76f3f3e0662e6930bf1aa735b90738edde7b7f24b2b0a329fce9233 → SHA256 of darwin-amd64 tarball
#   0441669122d76453fdcefaa00be40208efe35f04a9e4effd697b3f769addb61a → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.43"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.43/mindx-2.6.43-darwin-amd64.tar.gz"
      sha256 "83eb82d3e76f3f3e0662e6930bf1aa735b90738edde7b7f24b2b0a329fce9233"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.43/mindx-2.6.43-darwin-arm64.tar.gz"
      sha256 "0441669122d76453fdcefaa00be40208efe35f04a9e4effd697b3f769addb61a"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
