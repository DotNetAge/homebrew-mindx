# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.2.14
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.2.14      → e.g. 2.2.0
#   v2.2.14          → e.g. v2.2.0
#   48e7e777ea286609a203923faa96eb7337f8d146171d1231fc3623cc37d59cf4 → SHA256 of darwin-amd64 tarball
#   39d6047a055dab18244f410e0203a098711aac76c3fa7a420c71f89ff6af59dc → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.2.14"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.14/mindx-2.2.14-darwin-amd64.tar.gz"
      sha256 "48e7e777ea286609a203923faa96eb7337f8d146171d1231fc3623cc37d59cf4"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.2.14/mindx-2.2.14-darwin-arm64.tar.gz"
      sha256 "39d6047a055dab18244f410e0203a098711aac76c3fa7a420c71f89ff6af59dc"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
