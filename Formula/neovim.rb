class Neovim < Formula
  desc "Ambitious Vim-fork focused on extensibility and agility"
  homepage "https://github.com/neovim/neovim"
  license "Apache-2.0"
  version "0.12.0"
  url "https://github.com/neovim/neovim/releases/download/v#{version}/nvim-macos-arm64.tar.gz"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "nvim-macos-arm64/bin/nvim"
  end

end