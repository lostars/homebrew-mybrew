class QbitCli < Formula
  desc "Another qBittorrent CLI"
  homepage "https://github.com/lostars/qbit-cli"
  version "0.13.3"
  sha256 "2e35b10d5dfd1f1d2816f636626ede3d0588cc11bb1410b79ea63eaa45102d42"
  url "https://github.com/lostars/qbit-cli/releases/download/v#{version}/qbit_#{version}_darwin_arm64.tar.gz"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "qbit"
    generate_completions_from_executable(bin/"qbit", "completion")
  end

end
