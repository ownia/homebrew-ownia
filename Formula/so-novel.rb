class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "ab331bffb62c25dd9bb4ae750e5319607697cfd4ae5b4022634b5ca74b0038d9"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bf834b1da4ddeb4918b55160230360a1c4072d0daaed8cd69cd0d8f0b17698ff"
  end

  depends_on "maven" => :build
  depends_on "openjdk@17" => :build

  def install
    # ENV["JAVA_HOME"] = "/opt/homebrew/opt/openjdk@17/"
    ENV["JAVA_HOME"] = Formula["openjdk@17"].opt_prefix
    # ENV["PATH"] = "$JAVA_HOME/bin:$PATH"
    system "mvn", "clean", "package", "-Dmaven.test.skip=true", "-DjrePath=runtime"
    cp "bundle/rules/main-rules.json", "#{prefix}/main-rules.json"
    cp "bundle/config.ini", "#{prefix}/config.ini"
    inreplace "#{prefix}/config.ini", /^active-rules\s*=\s*.*$/, "active-rules = #{prefix}/main-rules.json"
    cp "target/app-jar-with-dependencies.jar", "#{prefix}/app.jar"
    java = Formula["openjdk@17"].opt_prefix/"bin/java"
    (prefix/"bin/so-novel").write <<~EOS
      #!/bin/bash
      #{java} -Dconfig.file=#{prefix}/config.ini -jar #{prefix}/app.jar
    EOS
  end

  test do
    assert shell_output("test -x #{bin}/so-novel")
  end
end
