class QbitCli < Formula
  desc "Another qBittorrent CLI"
  homepage "https://github.com/lostars/qbit-cli"
  version "0.13.1"
  sha256 "c90848b55b4145da447d3154e7522a063b38aa9e2c468bb685e93ea51accc2c8"
  url "https://github.com/lostars/qbit-cli/releases/download/v#{version}/qbit_#{version}_darwin_arm64.tar.gz"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "qbit"
    generate_completions_from_executable(bin/"qbit", "completion")
  end

end
