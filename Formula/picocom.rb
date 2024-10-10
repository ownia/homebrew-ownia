class Picocom < Formula
  # switch to a new fork
  desc "Minimal dumb-terminal emulation program"
  homepage "https://gitlab.com/wsakernel/picocom"
  url "https://gitlab.com/wsakernel/picocom/-/archive/2024-07/picocom-2024-07.tar.gz"
  sha256 "4379de2ec591a5848123f37ccdbc7fbeee6dd3520ef1ce4119d84202fc268a17"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/picocom-2024-07"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f7a4928585ddce3fbc1c18d72c6dc5c70efdc8cd6c3aa7d3f16cb2aef80bb88c"
  end

  depends_on "go-md2man" => :build

  def install
    system "make"
    system "make", "doc"
    bin.install "picocom"
    man1.install "picocom.1"
  end

  test do
    system bin/"picocom", "--help"
  end
end
