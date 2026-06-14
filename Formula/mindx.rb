# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.1.0
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.1.0      → e.g. 2.2.0
#   v2.1.0          → e.g. v2.2.0
#   4e4770cfd063d691230bfc64bc6715bdd0c39c1c13023121d0a84fd3369866ce → SHA256 of darwin-amd64 tarball
#   2dbb7a9cdc82b8d5a6f5dcd6f9cc59af871e734e96919cc2a6da6ab3f0fbc647 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.1.0/mindx-2.1.0-darwin-amd64.tar.gz"
      sha256 "4e4770cfd063d691230bfc64bc6715bdd0c39c1c13023121d0a84fd3369866ce"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.1.0/mindx-2.1.0-darwin-arm64.tar.gz"
      sha256 "2dbb7a9cdc82b8d5a6f5dcd6f9cc59af871e734e96919cc2a6da6ab3f0fbc647"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
