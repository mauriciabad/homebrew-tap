cask "sukrara" do
  version "0.11.14"
  sha256 "99f40481e264d5fa85fd0bcbfb6663734508595d4c955f590fbb9a199011f3d1"

  url "https://github.com/mauriciabad/cgm-reading-mac-spike/releases/download/v#{version}/Sukrara-#{version}.dmg",
      verified: "github.com/mauriciabad/cgm-reading-mac-spike/"
  name "Sukrara"
  desc "Glucose readings from a Libre sensor in the menu bar"
  homepage "https://sukrara.mauri.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Sukrara.app"

  uninstall quit: "app.mauri.sukrara.poc"

  zap trash: [
    "~/Library/Application Support/Sukrara",
    "~/Library/Containers/app.mauri.sukrara.poc.widget",
    "~/Library/Group Containers/*.app.mauri.sukrara.poc",
    "~/Library/Logs/Sukrara.log",
    "~/Library/Preferences/app.mauri.sukrara.poc.plist",
  ]

  caveats <<~EOS
    Sukrara is not notarized by Apple yet, so macOS blocks the first launch with
    "Apple could not verify “Sukrara” is free of malware…". Click Done, then open
    System Settings → Privacy & Security, scroll to Security and click
    "Open Anyway" next to "“Sukrara” was blocked…", and confirm with your password.
    This is needed once. Apple's guide:
      https://support.apple.com/guide/mac-help/mh40616/mac
  EOS
end
