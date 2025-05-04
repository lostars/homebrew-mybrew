class FfprobeOsxexperts < Formula
  desc "FFmpeg static builds from OSXExperts"
  homepage "https://www.osxexperts.net/"

  if Hardware::CPU.arm?
    version "7.1.1"
    url "https://www.osxexperts.net/ffprobe#{version.to_s.gsub('.', '')}arm.zip"
    sha256 "ae77d6751f4db81098a11dcc966a8d098925411430169475c8f8a7bfad76188b"
  else
    version "7.1"
    url "https://www.osxexperts.net/ffprobe#{version.to_s.gsub('.', '')}intel.zip"
    sha256 "ce5414269f0efa1e88b5e23b57f801d5b9a40be554716544936e0332b4601a62"
  end

  def install
    bin.install Dir["ffprobe"]
  end
end