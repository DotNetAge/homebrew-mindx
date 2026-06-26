# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.7
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.7      → e.g. 2.2.0
#   v2.3.7          → e.g. v2.2.0
#   ab975f625c1f666759cfc14984b7f2e8b102a3cea92c2bbd606b47266225c82f → SHA256 of darwin-amd64 tarball
#   2af3c35733eefe4e3c090a0a1277cea7cb85486495025f474f9abbdd8804f5ef → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.7"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.7/mindx-2.3.7-darwin-amd64.tar.gz"
      sha256 "ab975f625c1f666759cfc14984b7f2e8b102a3cea92c2bbd606b47266225c82f"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.7/mindx-2.3.7-darwin-arm64.tar.gz"
      sha256 "2af3c35733eefe4e3c090a0a1277cea7cb85486495025f474f9abbdd8804f5ef"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
