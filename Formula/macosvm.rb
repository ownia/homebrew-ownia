class Macosvm < Formula
  desc "Tool for running macOS guest virtual machines"
  homepage "https://github.com/s-u/macosvm"
  url "https://github.com/s-u/macosvm/archive/641c3cf407bd04a429735a40b4ba2dcc008b813a.tar.gz"
  version "0.2-2"
  sha256 "6753c90abe0d0da5fe0506ac34a31ae9ab3633f8af1c9bdd7b4b451a69aefe05"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/macosvm-0.2-2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bc7a41f15201e449eeae2e4ac4e21368fdd63aeca3276a6b3c8d53a0964b0b67"
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
