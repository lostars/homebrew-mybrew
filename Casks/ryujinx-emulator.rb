cask "ryujinx-emulator" do
  version "1.3.2"
  url "https://github.com/iurehg8uetgyh8ui5e/sr/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Ryujinx is an open-source Nintendo Switch emulator, originally created by gdkchan, written in C#"
  homepage "https://github.com/iurehg8uetgyh8ui5e/sr"

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx"
  ]
end
