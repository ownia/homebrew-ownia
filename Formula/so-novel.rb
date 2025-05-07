class SoNovel < Formula
  desc "Novel download tool"
  homepage "https://github.com/freeok/so-novel"
  url "https://github.com/freeok/so-novel/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "6fda6d416865fb7f1d909ac521f22641bbe8e4dc487ab5aec2b05eb87b8fb52b"
  license "AGPL-3.0-only"
  revision 1

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/so-novel-1.8.1_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a563ecc8efb4cd12557be7c110fd1bb19eb20134083fdda224a09325e321579b"
  end

  depends_on "maven" => :build
  depends_on "openjdk@17" => :build

  # temp fix
  patch :DATA

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

__END__
From 567e98f446bfe9991a607c1019bde6cebaf51334 Mon Sep 17 00:00:00 2001
From: Weizhao Ouyang <o451686892@gmail.com>
Date: Wed, 7 May 2025 23:08:56 +0800
Subject: [PATCH] :bug: fix watchConfig NoResourceException

Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
 src/main/java/com/pcdd/sonovel/Main.java | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/src/main/java/com/pcdd/sonovel/Main.java b/src/main/java/com/pcdd/sonovel/Main.java
index 10a219a..d356674 100644
--- a/src/main/java/com/pcdd/sonovel/Main.java
+++ b/src/main/java/com/pcdd/sonovel/Main.java
@@ -1,5 +1,6 @@
 package com.pcdd.sonovel;
 
+import cn.hutool.core.io.FileUtil;
 import cn.hutool.core.io.resource.ResourceUtil;
 import cn.hutool.core.lang.Console;
 import cn.hutool.core.lang.ConsoleTable;
@@ -27,6 +28,7 @@
 import java.io.File;
 import java.util.List;
 import java.util.Scanner;
+import java.nio.file.Paths;
 
 import static org.fusesource.jansi.AnsiRenderer.render;
 
@@ -198,7 +200,13 @@ private static void printHint() {
     }
 
     private static void watchConfig() {
-        String path = System.getProperty("user.dir") + File.separator + ConfigUtils.resolveConfigFileName();
+        String path;
+        String configFilePath = System.getProperty("config.file");
+        if (!FileUtil.exist(configFilePath)) {
+            path = System.getProperty("user.dir") + File.separator + ConfigUtils.resolveConfigFileName();
+        } else {
+            path = Paths.get(configFilePath).toAbsolutePath().toString();
+        }
         Setting setting = new Setting(path);
         // 监听配置文件
         setting.autoLoad(true, aBoolean -> {
@@ -208,4 +216,4 @@ private static void watchConfig() {
         });
     }
 
-}
\ No newline at end of file
+}
