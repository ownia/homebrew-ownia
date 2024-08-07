cask "injectgui" do
  version "1.1.1"
  sha256 "133be6a4c381f02015c1e9058e10149f3954e88cbe2ef4dbcdfd63fc8d74a0fb"

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
