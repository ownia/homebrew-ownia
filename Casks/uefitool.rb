cask "uefitool" do
  version "76"
  sha256 "7f0290137e45e0df25f7cc9fbb8656524b3fb36cf7ee95c9a0879801eb596c94"

  url "https://github.com/LongSoft/UEFITool/releases/download/A#{version}/UEFITool_NE_A#{version}_universal_mac.dmg"
  name "UEFITool"
  desc "UEFI firmware image viewer and editor"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on :macos

  app "UEFITool.app"
end
