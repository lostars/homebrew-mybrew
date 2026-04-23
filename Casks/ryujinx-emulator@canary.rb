cask "ryujinx-emulator@canary" do
  version "1.3.274"
  url "https://git.ryujinx.app/Ryubing/Canary/releases/download/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://git.ryujinx.app/ryubing/canary"

  app "Ryujinx.app"

  conflicts_with cask: ["ryujinx-emulator"]

  zap trash: [
    "~/Library/Application Support/Ryujinx"
  ]
end
