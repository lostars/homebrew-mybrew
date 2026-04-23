cask "dart-simple-live" do
  version "1.11.4"
  sha256 "0c361e1e60ae9fad167701f66e69886b4d400c9ba061a96bc8642a00cd3ac6b6"
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
