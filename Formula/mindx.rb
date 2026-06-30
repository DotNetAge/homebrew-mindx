# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.11
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.11      → e.g. 2.2.0
#   v2.3.11          → e.g. v2.2.0
#   f257f940adbe16bf94e653c350ed7357d38a8a1a2709fb44fc043c3cda2c2518 → SHA256 of darwin-amd64 tarball
#   24198fee0a4f458377742a4781583ea03a64fc448e8207a727d529daadb1cd1e → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.11"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.11/mindx-2.3.11-darwin-amd64.tar.gz"
      sha256 "f257f940adbe16bf94e653c350ed7357d38a8a1a2709fb44fc043c3cda2c2518"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.11/mindx-2.3.11-darwin-arm64.tar.gz"
      sha256 "24198fee0a4f458377742a4781583ea03a64fc448e8207a727d529daadb1cd1e"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
