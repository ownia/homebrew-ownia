cask "injectgui" do
  version ".1.2.1"
  sha256 "d052190b2da84c0ed8e258e474842b146b0e9d4777517d523fd680ec0bbae053"

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
