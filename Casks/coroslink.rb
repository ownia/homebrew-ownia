cask "coroslink" do
  version "0.1.35"
  sha256 "3211dcb653907de863a851e09f512e167c1e15e5429384b798ce68ad220d4b71"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
