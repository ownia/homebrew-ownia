class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.7.0-beta.2.tar.gz"
  sha256 "55e430ac1f0a99822fedb4c329959e0e7b8281e37325993d3ae8d921d2f766d6"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.6.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "97c338384e7491fcc5df703316fb33691e55647690568bc0734a8981e061df55"
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
