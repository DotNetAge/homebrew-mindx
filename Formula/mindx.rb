# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.6.52
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.6.52      → e.g. 2.2.0
#   v2.6.52          → e.g. v2.2.0
#   9b406bc14f90f26df30e323b2f4226dfbba78a0edeeb8d85fb216fab72e3485c → SHA256 of darwin-amd64 tarball
#   ec0d120dbe369f875d107196ff1a34adb64d6917ad1fe43a17659603af7f3066 → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.6.52"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.52/mindx-2.6.52-darwin-amd64.tar.gz"
      sha256 "9b406bc14f90f26df30e323b2f4226dfbba78a0edeeb8d85fb216fab72e3485c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.6.52/mindx-2.6.52-darwin-arm64.tar.gz"
      sha256 "ec0d120dbe369f875d107196ff1a34adb64d6917ad1fe43a17659603af7f3066"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
