cask "dart-simple-live" do
  version "1.7.5"
  revision "10705"
  url "https://github.com/xiaoyaocz/dart_simple_live/releases/download/v#{version}/simple_live_app-#{version}+#{revision}-macos.dmg"
  name "simple_live"
  desc "简简单单的看直播"
  homepage "https://github.com/xiaoyaocz/dart_simple_live"

  app "Simple Live.app"
end
