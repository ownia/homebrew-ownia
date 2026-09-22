cask "coroslink" do
  version "0.1.40"
  sha256 "153684f8629aac70ed6904a123c26c8c9401b3d1d512542bcfaaf94108fde327"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
