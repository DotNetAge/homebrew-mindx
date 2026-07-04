# typed: false
# frozen_string_literal: true
# Template: DotNetAge/mindx/v2.3.14
# Placeholders (replaced by CI/release script):
#   DotNetAge/mindx  → e.g. DotNetAge/mindx
#   2.3.14      → e.g. 2.2.0
#   v2.3.14          → e.g. v2.2.0
#   b09464c89d1b2b7ae09fe54a4bdfb2d838851c42bce9e931014914c7c5e6a41f → SHA256 of darwin-amd64 tarball
#   1d38e35fae2fb70ee3616e4c0ae2b86432fbdeb278f6b6c415ca6317ad112e6f → SHA256 of darwin-arm64 tarball
#
# Tap repo: https://github.com/DotNetAge/homebrew-mindx

class Mindx < Formula
  desc "MindX - AI-native multi-agent conversation platform"
  homepage "https://github.com/DotNetAge/mindx"
  license "MIT"
  version "2.3.14"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.14/mindx-2.3.14-darwin-amd64.tar.gz"
      sha256 "b09464c89d1b2b7ae09fe54a4bdfb2d838851c42bce9e931014914c7c5e6a41f"
    end

    if Hardware::CPU.arm?
      url "https://github.com/DotNetAge/mindx/releases/download/v2.3.14/mindx-2.3.14-darwin-arm64.tar.gz"
      sha256 "1d38e35fae2fb70ee3616e4c0ae2b86432fbdeb278f6b6c415ca6317ad112e6f"
    end
  end

  def install
    bin.install "mindx"
  end

  test do
    assert_match "MindX", shell_output("#{bin}/mindx --help")
  end
end
