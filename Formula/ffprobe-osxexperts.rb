class FfprobeOsxexperts < Formula
  desc "FFmpeg static builds from OSXExperts"
  homepage "https://www.osxexperts.net/"

  if Hardware::CPU.arm?
    url "https://www.osxexperts.net/ffprobe711arm.zip"
    sha256 "ae77d6751f4db81098a11dcc966a8d098925411430169475c8f8a7bfad76188b"
  else
    url "https://www.osxexperts.net/ffprobe71intel.zip"
    sha256 "ce5414269f0efa1e88b5e23b57f801d5b9a40be554716544936e0332b4601a62"
  end

  version do
      match = url.match(/ffmpeg(\d)(\d)(\d)(arm|intel)\.zip/)
      next "#{match[1]}.#{match[2]}.#{match[3]}" if match
  end

  def install
    bin.install Dir["ffprobe"]
  end
end