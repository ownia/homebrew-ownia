class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "bd4f9d49b207c434b9fc9a7c331d517f2cee857216bd47f0d305d8bfa94d843b"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.8.1_1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9a1745dc277cd1123173865e1b158800cd5d58b5259efdff1f1ea3c42d42580a"
  end

  depends_on "maven" => :build
  depends_on "openjdk@17" => :build

  def install
    # ENV["JAVA_HOME"] = "/opt/homebrew/opt/openjdk@17/"
    ENV["JAVA_HOME"] = Formula["openjdk@17"].opt_prefix
    # ENV["PATH"] = "$JAVA_HOME/bin:$PATH"
    system "mvn", "clean", "package", "-Dmaven.test.skip=true"
    cp "config.ini", "#{prefix}/config.ini"
    cp "target/app-jar-with-dependencies.jar", "#{prefix}/app.jar"
    (prefix/"bin/so-novel").write <<~EOS
      #!/bin/bash
      java -Dconfig.file=#{prefix}/config.ini -Denv=prod -jar #{prefix}/app.jar
    EOS
  end

  test do
    assert shell_output("test -x #{bin}/so-novel")
  end
end
