cask "final-cut-pro" do
  version "11.1.1"
  url "https://secure-appldnld.apple.com/Final_Cut_Pro_X/082-42810-20250520-d7183f76-a105-4af1-a4b1-0f670d6fd97f/FinalCutProTrial.dmg"
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
