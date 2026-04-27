cask "xquartz" do
  version "2.8.6_beta5"
  sha256 "c534e31b307c47b957a190aa91408d8073ade85a5dce3572ee8dfe1b47684933"

  url "https://github.com/XQuartz/XQuartz/releases/download/XQuartz-#{version}/XQuartz-#{version}.pkg",
      verified: "github.com/XQuartz/XQuartz/"
  name "XQuartz"
  desc "Open-source version of the X.Org X Window System"
  homepage "https://www.xquartz.org/"

  livecheck do
    url "https://www.xquartz.org/releases/sparkle-r1/beta.xml"
    strategy :sparkle do |item|
      item.short_version.delete_prefix("XQuartz-")
    end
  end

  auto_updates true

  pkg "XQuartz-#{version}.pkg"

  uninstall launchctl: "org.xquartz.privileged_startx",
            pkgutil:   "org.xquartz.X11"

  zap trash: [
        "~/.Xauthority",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.xquartz.x11.sfl*",
        "~/Library/Application Support/XQuartz",
        "~/Library/Caches/org.xquartz.X11",
        "~/Library/Cookies/org.xquartz.X11.binarycookies",
        "~/Library/HTTPStorages/org.xquartz.X11",
        "~/Library/Logs/X11/org.xquartz.log",
        "~/Library/Logs/X11/org.xquartz.log.old",
        "~/Library/Preferences/org.macosforge.xquartz.X11.plist",
        "~/Library/Preferences/org.xquartz.X11.plist",
        "~/Library/Saved Application State/org.xquartz.X11.savedState",
        "~/Library/WebKit/org.xquartz.X11",
      ],
      rmdir: [
        "~/.fonts",
        "~/Library/Logs/X11",
      ]
end
