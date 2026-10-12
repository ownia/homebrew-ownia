cask "coroslink" do
  version "0.1.52"
  sha256 "f9594db9bde439340f332f1b70486ad2193f021b6019708cc84af7b3d5e768a0"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
