class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.11.0.tar.gz"
  sha256 "97b090ad0eed214601644b4211417908a915e6a302b3dd3131f39971b711441f"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.11.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d8295db6f4ab4064f7267323f259556914a9716e3936a760c6527d8e6aa647cb"
  end

  depends_on "maven"
  depends_on "openjdk@21"

  def install
    ENV["JAVA_HOME"] = formula_opt_prefix("openjdk@21")
    system "mvn", "clean", "package", "-Dmaven.test.skip=true", "-DjrePath=runtime"
    cp "bundle/rules/main.json", "#{prefix}/main.json"
    cp "bundle/config.ini", "#{prefix}/config.ini"
    inreplace "#{prefix}/config.ini", /^active-rules\s*=\s*.*$/, "active-rules = #{prefix}/main.json"
    cp "target/app-jar-with-dependencies.jar", "#{prefix}/app.jar"
    java = formula_opt_prefix("openjdk@21")/"bin/java"
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
