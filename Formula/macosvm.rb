class Macosvm < Formula
  desc "Tool for running macOS guest virtual machines"
  homepage "https://github.com/s-u/macosvm"
  url "https://github.com/s-u/macosvm/archive/641c3cf407bd04a429735a40b4ba2dcc008b813a.tar.gz"
  version "0.2-2"
  sha256 "6753c90abe0d0da5fe0506ac34a31ae9ab3633f8af1c9bdd7b4b451a69aefe05"
  license "GPL-2.0-or-later"

  depends_on "make" => :build

  def install
    system "make"
    bin.install "macosvm/macosvm"
  end

  test do
    system bin/"macosvm", "--version"
  end
end
