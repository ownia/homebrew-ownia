cask "coroslink" do
  version "0.1.42"
  sha256 "8a143410c66e93a66794a5dde1ccb5bd2739d912682032ff30bbce0d63ea5009"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
