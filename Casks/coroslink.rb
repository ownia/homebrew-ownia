cask "coroslink" do
  version "0.1.60"
  sha256 "c99f092234375968b83b6625fe9e38b48629dba3b3b40f209009c2e79d353dff"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
