cask "ryujinx-emulator" do
  version "1.3.1"
  url "https://github.com/Ryubing/Stable-Releases/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://github.com/Ryubing/Stable-Releases"

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx"
  ]
end
