class QbitCli < Formula
  desc "Another qBittorrent CLI"
  homepage "https://github.com/lostars/qbit-cli"
  version "0.13.2"
  sha256 "f76b8b6a9ff6512aae77b4248a6ddf727ef9947c67647580ff90655a08a22bc9"
  url "https://github.com/lostars/qbit-cli/releases/download/v#{version}/qbit_#{version}_darwin_arm64.tar.gz"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "qbit"
    generate_completions_from_executable(bin/"qbit", "completion")
  end

end
