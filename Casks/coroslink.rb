cask "coroslink" do
  version "0.1.33"
  sha256 "a805ed65ce2a7100908eb42474061c9bbefc474d02bedba7362985fb7761f013"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
