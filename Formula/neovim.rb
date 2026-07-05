class Neovim < Formula
  desc "Ambitious Vim-fork focused on extensibility and agility"
  homepage "https://github.com/neovim/neovim"
  license "Apache-2.0"
  version "0.12.4"
  sha256 "51ab83afa66d663627c2ab1be43209b0f4e81360d4598b53efaa4d8195f24c89"
  url "https://github.com/neovim/neovim/releases/download/v#{version}/nvim-macos-arm64.tar.gz"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]   if Dir.exist?("lib")
    share.install Dir["share/*"] if Dir.exist?("share")
  end

end
