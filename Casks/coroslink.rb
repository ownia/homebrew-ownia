cask "coroslink" do
  version "0.1.58"
  sha256 "417d7502dc3d54e309b141fa58b685896aaadc0c55b08728632191d3f279e3b2"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
