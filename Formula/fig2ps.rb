class Fig2ps < Formula
  desc "Perl script designed to convert Xfig files to postscript or PDF files"
  homepage "https://sourceforge.net/projects/fig2ps"
  url "https://downloads.sourceforge.net/project/fig2ps/fig2ps-1.5.tar.bz2"
  sha256 "e59dece4106beb08236e6c4c5827e0ad8a5ed0276d3444676019e19ebd0c49b9"
  license "GPL-2.0-or-later"

  depends_on "fig2dev"

  def install
    system "make", "install-home", "HOME=#{prefix}"
  end

  test do
    system "#{bin}/fig2ps", "--version"
  end
end
