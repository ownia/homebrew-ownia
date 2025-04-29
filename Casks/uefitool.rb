cask "uefitool" do
  version "71"
  sha256 "8475df3cd94ab798b2cac286b0daf578326244a749d29eab93a6a86c881bb3eb"

  url "https://github.com/LongSoft/UEFITool/releases/download/A#{version}/UEFITool_NE_A#{version}_universal_mac.dmg"
  name "UEFITool"
  desc "UEFI firmware image viewer and editor"
  homepage "https://github.com/LongSoft/UEFITool"

  app "UEFITool.app"
end
