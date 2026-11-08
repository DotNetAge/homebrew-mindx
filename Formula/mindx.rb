# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.22
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.22      → e.g. 2.2.0
#   v2.6.22          → e.g. v2.2.0
#   13b05c04ad7b70e2c2e8e3d84fdc92f07103333073a93065f9a803f927dd4f1a → SHA256 of darwin-amd64 tarball
#   52268afee657c421e5a43f04d394ddb18ba000e61f3ad8e934fa6bfd528f02cd → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.22"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.22/mindx-2.6.22-darwin-amd64.tar.gz"
      sha256 "13b05c04ad7b70e2c2e8e3d84fdc92f07103333073a93065f9a803f927dd4f1a"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.22/mindx-2.6.22-darwin-arm64.tar.gz"
      sha256 "52268afee657c421e5a43f04d394ddb18ba000e61f3ad8e934fa6bfd528f02cd"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
