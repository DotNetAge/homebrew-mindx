# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.0.6
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.0.6      → e.g. 2.2.0
#   v2.0.6          → e.g. v2.2.0
#   df14e7da50667a5280f676fcc3b0b0fa4f2b24a268c2ce4202f84de10053380c → SHA256 of darwin-amd64 tarball
#   da5c02742255fffd802157dd38db51ab014761040750ed92698ed1087f051d4e → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.0.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.0.6/mindx-2.0.6-darwin-amd64.tar.gz"
      sha256 "df14e7da50667a5280f676fcc3b0b0fa4f2b24a268c2ce4202f84de10053380c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.0.6/mindx-2.0.6-darwin-arm64.tar.gz"
      sha256 "da5c02742255fffd802157dd38db51ab014761040750ed92698ed1087f051d4e"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
