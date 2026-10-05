cask "coroslink" do
  version "0.1.51"
  sha256 "bf5e7724789365a542e3d53902d21cd50136f457e0900676c85092787adfcdcf"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
