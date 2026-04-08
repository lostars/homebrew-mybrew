class FfprobeOsxexperts < Formula
  desc "FFmpeg static builds from OSXExperts"
  homepage "https://www.osxexperts.net/"

  if Hardware::CPU.arm?
    version "8.1"
    url "https://www.osxexperts.net/ffprobe#{version.to_s.gsub('.', '')}arm.zip"
  else
    version "8.0"
    url "https://www.osxexperts.net/ffprobe#{version.to_s.gsub('.', '')}intel.zip"
  end

  def install
    bin.install Dir["ffprobe"]
  end
end
