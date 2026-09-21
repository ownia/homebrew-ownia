cask "coroslink" do
  version "0.1.38"
  sha256 "ce1a7e6e0f70e4f09320d3e6cf80030c8d56d4989c873e1aac228c5e56b09ab1"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
