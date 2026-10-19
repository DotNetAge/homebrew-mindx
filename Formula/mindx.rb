# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.5.12
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.5.12      → e.g. 2.2.0
#   v2.5.12          → e.g. v2.2.0
#   5c23d9830bdd50b65c064402fe7eff90a954fc604853afc75dd401676927ad43 → SHA256 of darwin-amd64 tarball
#   dad8fc9cf8660da9b37255d2d69115b4dcf5dd87c43743518f3199528f08c5b8 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.5.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.12/mindx-2.5.12-darwin-amd64.tar.gz"
      sha256 "5c23d9830bdd50b65c064402fe7eff90a954fc604853afc75dd401676927ad43"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.5.12/mindx-2.5.12-darwin-arm64.tar.gz"
      sha256 "dad8fc9cf8660da9b37255d2d69115b4dcf5dd87c43743518f3199528f08c5b8"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
