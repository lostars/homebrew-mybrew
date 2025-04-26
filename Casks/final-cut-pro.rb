cask "final-cut-pro" do
  version "11.1"
  url "https://secure-appldnld.apple.com/Final_Cut_Pro_X/082-09025-20250325-cec17631-72bd-46d7-bfa9-69c64a3bf721/FinalCutProTrial.dmg"
  name "final-cut-pro"
  desc "Final Cut Pro 11. Simply intelligent."
  homepage "https://www.apple.com/final-cut-pro/"

  depends_on macos: :sonoma
  on_macos do
    min_version = "14.6"
    if Gem::Version.new(MacOS.version.to_s) < Gem::Version.new(min_version)
      odie "Final Cut Pro #{version} requires macOS >= #{min_version}. Your version: #{MacOS.version}"
    end
  end

  app "Final Cut Pro.app"

end
