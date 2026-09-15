cask "coroslink" do
  version "0.1.32"
  sha256 "e287108de0fe39fc7e3318ea979cc263ba5862b58d6c1107c3c2dac932fe728f"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
