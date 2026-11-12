cask "sukrara" do
  version "0.14.4"
  sha256 "b61c3e4b0432a314936bdeb6b681695663758a63338738324b2df2d449548a44"

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

  auto_updates true
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
