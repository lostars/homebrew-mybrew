cask "ryujinx-emulator" do
  version "1.2.82"
  url "https://github.com/Ryubing/Ryujinx/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://github.com/Ryubing/Ryujinx"

  app "Ryujinx.app"

end
