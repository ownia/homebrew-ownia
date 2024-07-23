class Emailconverter < Formula
  desc "Converts email files (eml, msg) to pdf"
  homepage "https://www.whitebyte.info/publications/eml-to-pdf-converter"
  url "https://github.com/nickrussler/email-to-pdf-converter/releases/download/3.0.0/emailconverter-3.0.0-all.jar"
  sha256 "a0d8cdfcd169af6340936b9280bd2b178e79f9d496bebdb53b1e49a4d88f378c"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install "emailconverter-3.0.0-all.jar"
    bin.write_jar_script libexec/"emailconverter-3.0.0-all.jar", "emailconverter"
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
