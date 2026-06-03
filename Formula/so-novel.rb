class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.10.2.tar.gz"
  sha256 "f3ef2b8dd3fb1d05130ba4c4f9f1eab306bfc2a98db95c54d7b7aac79ecfb6ca"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.10.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7651c914c3d1e3eb7bb39b2bab314daa077d1e02856125cdb25e8bbad915d6af"
  end

  depends_on "maven"
  depends_on "openjdk@21"

  def install
    ENV["JAVA_HOME"] = Formula["openjdk@21"].opt_prefix
    system "mvn", "clean", "package", "-Dmaven.test.skip=true", "-DjrePath=runtime"
    cp "bundle/rules/main.json", "#{prefix}/main.json"
    cp "bundle/config.ini", "#{prefix}/config.ini"
    inreplace "#{prefix}/config.ini", /^active-rules\s*=\s*.*$/, "active-rules = #{prefix}/main.json"
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
