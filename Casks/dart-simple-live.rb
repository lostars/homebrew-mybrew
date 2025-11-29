cask "dart-simple-live" do
  version "1.11.2"
  version_with_zeros = version.split('.').map.with_index { |s, i| i > 0 && s.length == 1 ? "0#{s}" : s }.join
  url "https://github.com/lostars/dart_simple_live/releases/download/v#{version}/simple_live_app-#{version}+#{version_with_zeros}-macos.dmg"
  name "simple_live"
  desc "简简单单的看直播"
  homepage "https://github.com/lostars/dart_simple_live"

  app "Simple Live.app"

  zap trash: [
    "~/Library/Containers/com.xycz.simpleLiveApp",
    "~/Library/Application Scripts/com.xycz.simpleLiveApp",
  ]
end
