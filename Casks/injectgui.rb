cask "injectgui" do
  version "1.2.3"
  sha256 "1c3043b79303372f1fef5407eed885a30318a0fb5d91a38df4510ebd5804d8d8"

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
