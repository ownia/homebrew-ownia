cask "coroslink" do
  version "0.1.34"
  sha256 "70c01094c7aee909ff45582ab804a18d57421044dad06f15cf7d8cdcf36abf72"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
