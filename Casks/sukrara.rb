cask "sukrara" do
  version "0.11.41"
  sha256 "2cd7bd9ec9f2c9ee46a35c34a84fbe6d11971607d4c5658f2a2eeb51f6a5dba6"

  url "https://github.com/mauriciabad/cgm-reading-mac-spike/releases/download/v#{version}/Sukrara-#{version}.dmg"
  name "Sukrara"
  desc "Glucose readings from a Libre sensor in the menu bar"
  homepage "https://sukrara.mauri.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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
