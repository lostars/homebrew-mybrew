cask "ryujinx-emulator@canary" do
  version "1.3.54"
  url "https://github.com/Ryubing/Canary-Releases/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://github.com/Ryubing/Canary-Releases"

  app "Ryujinx(Canary).app"

  zap trash: [
    "~/Library/Application Support/Ryujinx"
  ]
end
