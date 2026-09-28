cask "coroslink" do
  version "0.1.49"
  sha256 "13f17edaf2e04c784a8302ba130f67cf8ace1285edd33e2502bbfe0683c75ecf"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
