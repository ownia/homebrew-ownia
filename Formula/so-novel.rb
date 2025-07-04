class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.8.4.tar.gz"
  sha256 "491b234fb7c7b167964cf76b385096db55d1def9f50da091d3a4d58e0d8e7541"
  license "AGPL-3.0-only"
  revision 2

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.8.4_2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b8aa810202e778138e06a75141cc31aac117e6d42e5d426d49acded4c630236b"
  end

  depends_on "maven" => :build
  depends_on "openjdk@17" => :build

  def install
    # ENV["JAVA_HOME"] = "/opt/homebrew/opt/openjdk@17/"
    ENV["JAVA_HOME"] = Formula["openjdk@17"].opt_prefix
    # ENV["PATH"] = "$JAVA_HOME/bin:$PATH"
    system "mvn", "clean", "package", "-Dmaven.test.skip=true"
    cp "bundle/rules/main-rules.json", "#{prefix}/main-rules.json"
    cp "config.ini", "#{prefix}/config.ini"
    # inreplace "#{prefix}/config.ini", /^active-rules\s*=\s*.*$/, "active-rules = #{prefix}/main-rules.json"
    cp "target/app-jar-with-dependencies.jar", "#{prefix}/app.jar"
    java = Formula["openjdk@17"].opt_prefix/"bin/java"
    (prefix/"bin/so-novel").write <<~EOS
      #!/bin/bash
      TMP_RULES="$(pwd)/rules"
      mkdir -p "$TMP_RULES"
      cp "#{prefix}/main-rules.json" "$TMP_RULES/"
      trap 'rm -rf "$TMP_RULES"' EXIT
      #{java} -Dconfig.file=#{prefix}/config.ini -Denv=prod -jar #{prefix}/app.jar
    EOS
  end

  test do
    assert shell_output("test -x #{bin}/so-novel")
  end
end
