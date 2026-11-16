# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.29
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.29      → e.g. 2.2.0
#   v2.6.29          → e.g. v2.2.0
#   7cf2c578b3a9cdef2638e5dd7b8e0be6a31027a66ba864b43dd818bc4a096079 → SHA256 of darwin-amd64 tarball
#   cba85f2815f1a1bcfe777088a38db3a280b1e4f3af91dba86c6a2886ff67bb35 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.29"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.29/mindx-2.6.29-darwin-amd64.tar.gz"
      sha256 "7cf2c578b3a9cdef2638e5dd7b8e0be6a31027a66ba864b43dd818bc4a096079"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.29/mindx-2.6.29-darwin-arm64.tar.gz"
      sha256 "cba85f2815f1a1bcfe777088a38db3a280b1e4f3af91dba86c6a2886ff67bb35"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
