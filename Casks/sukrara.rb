cask "sukrara" do
  version "0.13.0"
  sha256 "0db5e209fbef18fe28f7565c6574f629797af495980c2e641dde0af07fbcd52d"

  url "https://github.com/mauriciabad/sukrara/releases/download/v#{version}/Sukrara-#{version}.dmg"
  name "Sukrara"
  desc "Live glucose from a Libre 3 wearer in the menu bar"
  homepage "https://sukrara.mauri.app/"

  # 0.x releases are GitHub prereleases, which the default GitHub strategies skip.
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Sukrara.app"

  uninstall quit: "app.mauri.sukrara"

  zap trash: [
    "~/Library/Application Support/app.mauri.sukrara",
    "~/Library/Application Support/Sukrara",
    "~/Library/Caches/app.mauri.sukrara",
    "~/Library/Containers/app.mauri.sukrara.poc.widget",
    "~/Library/Containers/app.mauri.sukrara.widget",
    "~/Library/Group Containers/*.app.mauri.sukrara",
    "~/Library/Group Containers/*.app.mauri.sukrara.poc",
    "~/Library/HTTPStorages/app.mauri.sukrara",
    "~/Library/Logs/app.mauri.sukrara",
    "~/Library/Logs/Sukrara.log",
    "~/Library/Preferences/app.mauri.sukrara.plist",
    "~/Library/Preferences/app.mauri.sukrara.poc.plist",
    "~/Library/Sounds/app.mauri.sukrara.*.caf",
  ]
end
