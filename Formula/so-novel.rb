class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.9.5.tar.gz"
  sha256 "41a70815e55e4e6a47af732cb9bbced6196d1c243318feeab2f2bee05bd48553"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.9.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e2f00a609e74b7097842167b2cf64d135f44f998c6a7469ee3d7badfdb40484c"
  end

  depends_on "maven"
  depends_on "openjdk@21"

  patch do
    url "https://github.com/freeok/so-novel/commit/ebb12c705f3bf9af750e8b386f34bcbf402cccd4.patch?full_index=1"
    sha256 "14f8bc52b849a331ba468365de8795597e26b8d39e4add93bd1a5efa46fbdeb3"
  end

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
