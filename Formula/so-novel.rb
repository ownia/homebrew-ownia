class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.12.0.tar.gz"
  sha256 "47c7cac185e1a3e460239c95680a4811894bc676e8d0cfb76dfbf28dad5fe9d1"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.12.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1a0da5171667b52a8b52dacb0f078a8aab4de208479de2352077687e4265bf54"
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
