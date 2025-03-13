cask "uefitool" do
  version "70"
  sha256 "f1f73e5712f3e1f4a620bbe2fdf1fb50ff42e59768b738a8a1dd321a8c7b2f18"

  url "https://github.com/LongSoft/UEFITool/releases/download/A#{version}/UEFITool_NE_A#{version}_universal_mac.zip"
  name "UEFITool"
  desc "UEFI firmware image viewer and editor"
  homepage "https://github.com/LongSoft/UEFITool"

  container type: :zip

  app "UEFITool.app"
end
