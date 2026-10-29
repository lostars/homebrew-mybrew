cask "ryujinx-emulator" do
  version "1.3.3"
  url "https://git.ryujinx.app/projects/Ryubing/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://git.ryujinx.app/projects/Ryubing"
  depends_on :macos

  app "Ryujinx.app"

  conflicts_with cask: ["ryujinx-emulator@canary"]

  zap trash: [
    "~/Library/Application Support/Ryujinx"
  ]
end
