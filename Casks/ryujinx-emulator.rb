cask "ryujinx-emulator" do
  version "1.3.2"
  url "https://git.ryujinx.app/api/v4/projects/1/packages/generic/Ryubing/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://git.ryujinx.app/ryubing/ryujinx"

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx"
  ]
end
