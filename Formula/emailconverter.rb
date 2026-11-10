class Emailconverter < Formula
  desc "Converts email files (eml, msg) to pdf"
  homepage "https://www.whitebyte.info/publications/eml-to-pdf-converter"
  url "https://github.com/nickrussler/email-to-pdf-converter/releases/download/4.0.0/emailconverter-4.0.0-all.jar"
  sha256 "89b34426d73493d17242292928e0a124a1d8c266b731b0be915c59f3ca632b10"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/emailconverter-4.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "01cde330991ee4a1c8ae4509b0cc1556516840388f877d4ccde75c4a6b493a06"
  end

  depends_on "openjdk"

  def install
    libexec.install "emailconverter-#{version}-all.jar"
    bin.write_jar_script libexec/"emailconverter-#{version}-all.jar", "emailconverter"
  end

  def caveats
    <<~EOS
      You should install wkhtmltopdf from Homebrew Cask:
        brew install --cask wkhtmltopdf
    EOS
  end

  test do
    system "#{bin}/emailconverter", "--version"
  end
end
