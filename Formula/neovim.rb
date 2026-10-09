class Neovim < Formula
  desc "Ambitious Vim-fork focused on extensibility and agility"
  homepage "https://github.com/neovim/neovim"
  license "Apache-2.0"
  version "0.12.6"
  sha256 "1dbd148222b051ba6c307c4d17a318ed083df018a4f6a5a0ce46955ffc9ab87b"
  url "https://github.com/neovim/neovim/releases/download/v#{version}/nvim-macos-arm64.tar.gz"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]   if Dir.exist?("lib")
    share.install Dir["share/*"] if Dir.exist?("share")
  end

end
