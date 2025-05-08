class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "bd4f9d49b207c434b9fc9a7c331d517f2cee857216bd47f0d305d8bfa94d843b"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9f670544a0d0d469bf15b0191c7ac17f125939ba588964ce6290513af9577d9d"
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
