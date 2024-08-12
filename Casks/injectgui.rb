cask "injectgui" do
  version "1.2.0"
  sha256 "ee6ae1ce40b1f1e8b09ef27c1f786eaf73660dd02d3c4c78600db3ec7115831f"

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
