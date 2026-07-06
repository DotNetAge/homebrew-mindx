# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.18
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.18      → e.g. 2.2.0
#   v2.3.18          → e.g. v2.2.0
#   23c4ad2f63e769b292a0950c7a5babab1057c072f444116ea37ebef85d5dbe0a → SHA256 of darwin-amd64 tarball
#   3b792b4a040ac3dcac898110d19cd05e050be9fe5f716b7bc9f0f3db029ccb95 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.18"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.18/mindx-2.3.18-darwin-amd64.tar.gz"
      sha256 "23c4ad2f63e769b292a0950c7a5babab1057c072f444116ea37ebef85d5dbe0a"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.18/mindx-2.3.18-darwin-arm64.tar.gz"
      sha256 "3b792b4a040ac3dcac898110d19cd05e050be9fe5f716b7bc9f0f3db029ccb95"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
