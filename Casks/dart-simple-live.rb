cask "dart-simple-live" do
  version "1.13.3"
  sha256 "cefc2ffbcbb24465c42d78916edf7f2019937a332a09a00a8977ab7ce449ee86"
  version_with_zeros = version.split('.').map.with_index { |s, i| i > 0 && s.length == 1 ? "0#{s}" : s }.join
  url "https://github.com/June6699/dart_simple_live/releases/download/v#{version}/simple_live_app-#{version}+#{version_with_zeros}-macos.dmg"
  name "simple_live"
  desc "简简单单的看直播"
  homepage "https://github.com/June6699/dart_simple_live"

  depends_on :macos
  
  app "Simple Live.app"

  zap trash: [
    "~/Library/Containers/com.xycz.simpleLiveApp",
    "~/Library/Application Scripts/com.xycz.simpleLiveApp",
  ]
end
