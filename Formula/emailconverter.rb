class Emailconverter < Formula
  desc "Converts email files (eml, msg) to pdf"
  homepage "https://www.whitebyte.info/publications/eml-to-pdf-converter"
  url "https://github.com/nickrussler/email-to-pdf-converter/releases/download/4.0.1/emailconverter-4.0.1-all.jar"
  sha256 "3191f62feeeef5fbab20ee6944d06ecb69dd02a38f7be51631b2d716ec6ee73e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/ownia/homebrew-ownia/releases/download/emailconverter-4.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "07604d6ba353d9ece0eda1bca6968910bf45a37f9a4934ee9c71e2a8ee09b9d1"
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
