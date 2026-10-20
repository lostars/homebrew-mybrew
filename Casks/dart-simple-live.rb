cask "dart-simple-live" do
  version "1.11.7"
  sha256 "4c6d0d7e41c56c7e38d2c91f05980057b6df17a7947e7184786bd9979a44a1d4"
  version_with_zeros = version.split('.').map.with_index { |s, i| i > 0 && s.length == 1 ? "0#{s}" : s }.join
  url "https://github.com/lostars/dart_simple_live/releases/download/v#{version}/simple_live_app-#{version}+#{version_with_zeros}-macos.dmg"
  name "simple_live"
  desc "简简单单的看直播"
  homepage "https://github.com/lostars/dart_simple_live"

  depends_on :macos
  
  app "Simple Live.app"

  zap trash: [
    "~/Library/Containers/com.xycz.simpleLiveApp",
    "~/Library/Application Scripts/com.xycz.simpleLiveApp",
  ]
end
