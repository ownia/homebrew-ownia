class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.5.9.tar.gz"
  sha256 "3cb684198e351e6bb8859c41df7bf1227b56bad58dafb205bec0711d3402a3ee"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.5.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "81140659af8a4b1b171d753d5da34fd5b81087b7515596457572e5502bb57fe9"
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
