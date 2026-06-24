class Macosvm < Formula
  desc "Tool for running macOS guest virtual machines"
  homepage "https://github.com/s-u/macosvm"
  url "https://github.com/s-u/macosvm/archive/refs/tags/0.2-3.tar.gz"
  sha256 "ec49789169d2e034081bd5997d7a0a29f77e8b111afb6bb406d59ac224050f2f"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/macosvm-0.2-3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "639393788582e0e93505e4f50e5a5eb0f0baf7625ddd032209914e8067ba1d21"
  end

  depends_on "make" => :build

  def install
    system "make"
    bin.install "macosvm/macosvm"
  end

  test do
    system bin/"macosvm", "--version"
  end
end
