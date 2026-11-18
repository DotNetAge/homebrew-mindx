# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.34
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.34      → e.g. 2.2.0
#   v2.6.34          → e.g. v2.2.0
#   6344fc916dd924e796ac474f3318f83b6eaf57df402237f303f94690002ba6fc → SHA256 of darwin-amd64 tarball
#   254f119d5011944d44506c952cc3c6f82643feca6ac055ecbab739b9c4915a0a → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.34"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.34/mindx-2.6.34-darwin-amd64.tar.gz"
      sha256 "6344fc916dd924e796ac474f3318f83b6eaf57df402237f303f94690002ba6fc"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.34/mindx-2.6.34-darwin-arm64.tar.gz"
      sha256 "254f119d5011944d44506c952cc3c6f82643feca6ac055ecbab739b9c4915a0a"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
