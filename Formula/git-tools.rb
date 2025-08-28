class GitTools < Formula
  include Language::Python::Shebang

  desc "Assorted git-related scripts and tools"
  homepage "https://github.com/MestreLion/git-tools"
  url "https://github.com/ownia/git-tools/archive/refs/tags/v20250828.tar.gz"
  sha256 "e70dad2f666ec887c858f2f008de3bd7749d15e9ed5caad6220aba621ff5b892"
  license "GPL-3.0-or-later"
  head "https://github.com/ownia/git-tools.git", branch: "homebrew-ownia"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/git-tools-20250828"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9c11b5e1c33d1e221c2893cbc98f10b6bac0e9387432118977dedee57f2349fc"
  end

  uses_from_macos "python", since: :catalina

  def install
    rewrite_shebang detected_python_shebang(use_python_from_path: true), "git-restore-mtime"
    bin.install buildpath.glob("git-*")
    man1.install buildpath.glob("man1/*.1")
  end

  test do
    assert_equal "git-restore-mtime version #{version}", shell_output("#{bin}/git-restore-mtime --version").chomp
    system "git", "init"
    system "git", "config", "user.name", "BrewTestBot"
    system "git", "config", "user.email", "BrewTestBot@example.com"
    touch "foo"
    system "git", "add", "foo"
    system "git", "commit", "-m", "foo"
    touch "foo"
    output = shell_output("#{bin}/git-restore-mtime . 2>&1")
    assert_match "1 files to be processed in work dir", output
    assert_match "1 files updated", output
    system "git", "checkout", "-b", "testrename"
    assert_match "testrename -> test", shell_output("#{bin}/git-branches-rename -n -v testrename test")
    touch "aaa"
    assert_equal ".", shell_output("#{bin}/git-find-uncommitted-repos -u .").chomp
    assert_match "Cloning into 'test'...", shell_output(
      "FILTER_BRANCH_SQUELCH_WARNING=1 #{bin}/git-clone-subset . test foo 2>&1",
    )
  end
end
