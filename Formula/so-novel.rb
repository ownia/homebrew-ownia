class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.5.8.tar.gz"
  sha256 "bce5709bf62d0131d92b01b435f653ee769116da810ef861db505ac241f86d8a"
  license "Apache-2.0"
  revision 1

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.5.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9892438b38a4f3516da8eb338e3a7453eea2d05721de2720d344b2ca2e6746f7"
  end

  depends_on "maven" => :build
  depends_on "openjdk" => :build

  def install
    system "mvn", "clean", "package", "-DskipTests"
    cp "config.ini", "#{prefix}/config.ini"
    cp "target/app-jar-with-dependencies.jar", "#{prefix}/app.jar"
    (prefix/"bin/so-novel").write("#!/bin/bash\njava -Dconfig.file=#{prefix}/config.ini -jar #{prefix}/app.jar\n")
  end

  test do
    assert shell_output("test -x #{bin}/so-novel")
  end
end
