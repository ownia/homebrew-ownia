cask "coroslink" do
  version "0.1.62"
  sha256 "1f95f56611a5f7b8f5afb723e2485064d2fd00282dd654631d26d9efd28d0eb5"

  url "https://github.com/JunAkerBuilds/CorosLink/releases/download/v#{version}/CorosLink-#{version}-arm64.dmg"
  name "CorosLink"
  desc "Desktop app for COROS watch"
  homepage "https://github.com/JunAkerBuilds/CorosLink"

  depends_on macos: :monterey

  app "CorosLink.app"
end
