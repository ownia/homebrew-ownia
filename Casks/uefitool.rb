cask "uefitool" do
  version "75"
  sha256 "34140173de7f5c8bcdcab98b354d350179831282bdd10a21058b93f8af26b772"

  url "https://github.com/LongSoft/UEFITool/releases/download/A#{version}/UEFITool_NE_A#{version}_universal_mac.dmg"
  name "UEFITool"
  desc "UEFI firmware image viewer and editor"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: :big_sur

  app "UEFITool.app"
end
