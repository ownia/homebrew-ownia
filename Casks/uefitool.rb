cask "uefitool" do
  version "74"
  sha256 "372a636996c6e61461179ed96ee3d019c7636037c4f753c851553ef45b8ea412"

  url "https://github.com/LongSoft/UEFITool/releases/download/A#{version}/UEFITool_NE_A#{version}_universal_mac.dmg"
  name "UEFITool"
  desc "UEFI firmware image viewer and editor"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: ">= :big_sur"

  app "UEFITool.app"
end
