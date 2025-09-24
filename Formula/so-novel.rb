class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "7ec7fe71d1999f1404dc54ab37c668d2345fb50745dbb5ce75c7c635ba04e3d3"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.9.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "47640846d86cce1d10abbf8fb300c225f984c53d4cd5fa6fce1ee2d61c4cbc97"
  end

  depends_on "maven"
  depends_on "openjdk@21"

  def install
    ENV["JAVA_HOME"] = Formula["openjdk@21"].opt_prefix
    system "mvn", "clean", "package", "-Dmaven.test.skip=true", "-DjrePath=runtime"
    cp "bundle/rules/main-rules.json", "#{prefix}/main-rules.json"
    cp "bundle/config.ini", "#{prefix}/config.ini"
    inreplace "#{prefix}/config.ini", /^active-rules\s*=\s*.*$/, "active-rules = #{prefix}/main-rules.json"
    cp "target/app-jar-with-dependencies.jar", "#{prefix}/app.jar"
    java = Formula["openjdk@21"].opt_prefix/"bin/java"
    (prefix/"bin/so-novel").write <<~EOS
      #!/bin/bash
      #{java} -Dconfig.file=#{prefix}/config.ini -Dmode=tui -jar #{prefix}/app.jar "$@"
    EOS
  end

  test do
    output = shell_output("#{bin}/so-novel -V").strip
    clean_output = output.gsub(/\e\[[0-9;]*m/, "")
    assert_equal version.to_s, clean_output
  end
end
