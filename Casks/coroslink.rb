cask "coroslink" do
  version "0.1.44"
  sha256 "4d38e7758e6019b4c9b0e85167191f474c06c52141fd31d59ed8acfb9750e7d8"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
