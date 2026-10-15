cask "coroslink" do
  version "0.1.53"
  sha256 "4339971defc9ce7f09745d04f1d0b13651e1ef58ebcee563d04b8b7d8fb82a3a"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
