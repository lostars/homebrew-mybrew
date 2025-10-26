cask "ryujinx-emulator@canary" do
  version "1.3.194"
  url "https://git.ryujinx.app/api/v4/projects/68/packages/generic/Ryubing-Canary/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://git.ryujinx.app/ryubing/canary"

  app "Ryujinx.app"

  conflicts_with cask: ["ryujinx-emulator"]

  zap trash: [
    "~/Library/Application Support/Ryujinx"
  ]
end
