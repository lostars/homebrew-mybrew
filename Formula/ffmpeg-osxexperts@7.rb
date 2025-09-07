class FfmpegOsxexperts < Formula
  desc "FFmpeg static builds from OSXExperts"
  homepage "https://www.osxexperts.net/"

  if Hardware::CPU.arm?
    version "7.1.1"
    url "https://www.osxexperts.net/ffmpeg#{version.to_s.gsub('.', '')}arm.zip"
  else
    version "7.1"
    url "https://www.osxexperts.net/ffmpeg#{version.to_s.gsub('.', '')}intel.zip"
  end

  def install
    bin.install Dir["ffmpeg"]
  end
end