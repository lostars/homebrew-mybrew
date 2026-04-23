class TinypngCli < Formula
  desc "A TinyPNG CLI"
  homepage "https://github.com/lostars/tinypng-cli"
  version "1.0.0"
  sha256 "874428aefb54c29c0f1c5af531215fdf96bb9abbf451090e6acbbc95b4d2bd08"
  url "https://github.com/lostars/tinypng-cli/releases/download/v#{version}/tinypng-cli_#{version}_darwin_arm64.tar.gz"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "tinypng"
    generate_completions_from_executable(bin/"tinypng", "completion")
  end

end
