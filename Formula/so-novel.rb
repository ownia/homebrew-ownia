class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "c513813448a3cfb9341fa35dfcb2903ba5b4a8b3c7158d29a9e9d82cdb5fd254"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.7.0-beta.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "feee2b4776cd5a10445bf41df0011bf26b3bf002f5839bdd6226ee87eec72ddb"
  end

  depends_on "maven" => :build
  depends_on "openjdk@17" => :build

  def install
    # ENV["JAVA_HOME"] = "/opt/homebrew/opt/openjdk@17/"
    ENV["JAVA_HOME"] = Formula["openjdk@17"].opt_prefix
    # ENV["PATH"] = "$JAVA_HOME/bin:$PATH"
    system "mvn", "clean", "package", "-DskipTests"
    cp "config.ini", "#{prefix}/config.ini"
    cp "target/app-jar-with-dependencies.jar", "#{prefix}/app.jar"
    (prefix/"bin/so-novel").write("#!/bin/bash\njava -Dconfig.file=#{prefix}/config.ini -jar #{prefix}/app.jar\n")
  end

  test do
    assert shell_output("test -x #{bin}/so-novel")
  end
end
