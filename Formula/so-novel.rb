class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.9.2.tar.gz"
  sha256 "25f4f02214561aad04a6264881abb8bb8ccbe2d27cc42404443db0d562cdfac1"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.9.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "47640846d86cce1d10abbf8fb300c225f984c53d4cd5fa6fce1ee2d61c4cbc97"
  end

  depends_on "maven"
  depends_on "openjdk@17"

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
    # cli mode can fallback to tui mode
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
