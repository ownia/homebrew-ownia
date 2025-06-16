cask "uefitool" do
  version "72"
  sha256 "af849fe60ddc3fd8d26c38c4ec5eb6eeda8e2cbb1534f289249559f283804c44"

  url "https://github.com/LongSoft/UEFITool/releases/download/A#{version}/UEFITool_NE_A#{version}_universal_mac.dmg"
  name "UEFITool"
  desc "UEFI firmware image viewer and editor"
  homepage "https://github.com/LongSoft/UEFITool"

  app "UEFITool.app"
end
