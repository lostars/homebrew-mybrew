cask "cemu-emulator" do
  version "2.6"
  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg"
  name "cemu-emulator"
  desc "Cemu - Wii U emulator"
  homepage "https://github.com/cemu-project/Cemu"

  app "Cemu.app"

  zap trash: [
    "~/Library/Application Support/Cemu"
  ]
end
