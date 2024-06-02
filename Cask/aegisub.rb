cask "aegisub" do
  version "4.0.0"
  sha256 "8dbc4a0ed019a33ad3477aa682676386f753c8e194d8a6112e8a1c5e48db1b9b"

  url "https://github.com/ownia/Aegisub/releases/download/v#{version}/Aegisub-#{version}.dmg"
  name "Aegisub"
  desc "Cross-platform advanced subtitle editor"
  homepage "https://github.com/ownia/Aegisub"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Aegisub.app"

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]
end
