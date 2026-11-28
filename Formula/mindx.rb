# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.51
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.51      → e.g. 2.2.0
#   v2.6.51          → e.g. v2.2.0
#   a5e370941435959c75abef329fd259d9b34d6929121a9842a9bb91c42633fbf0 → SHA256 of darwin-amd64 tarball
#   efcf70ad66dabe345fc2181d096eb6f1d163598015843ff1db18c17299159de0 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.51"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.51/mindx-2.6.51-darwin-amd64.tar.gz"
      sha256 "a5e370941435959c75abef329fd259d9b34d6929121a9842a9bb91c42633fbf0"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.51/mindx-2.6.51-darwin-arm64.tar.gz"
      sha256 "efcf70ad66dabe345fc2181d096eb6f1d163598015843ff1db18c17299159de0"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
