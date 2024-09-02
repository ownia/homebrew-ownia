cask "injectgui" do
  version "1.2.2"
  sha256 "ab71a122909eda6edd81cfd068a9ba881ef727dc846e8b2b15e51f70e4a2a503"

  url "https://github.com/wibus-wee/InjectGUI/releases/download/v#{version}/InjectGUI.dmg"
  name "InjectGUI"
  desc "Integrated Injection Framework (GUI version)"
  homepage "https://github.com/wibus-wee/InjectGUI"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :github_latest
  end

  app "InjectGUI.app"
end
