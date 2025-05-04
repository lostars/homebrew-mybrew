class FfmpegOsxexperts < Formula
  desc "FFmpeg static builds from OSXExperts"
  homepage "https://www.osxexperts.net/"

  if Hardware::CPU.arm?
    version "7.1.1"
    url "https://www.osxexperts.net/ffmpeg#{version.to_s.gsub('.', '')}arm.zip"
    sha256 "011221d75eae36943b5a6a28f70e25928cfb5602fe616d06da0a3b9b55ff6b75"
  else
    version "7.1"
    url "https://www.osxexperts.net/ffmpeg#{version.to_s.gsub('.', '')}intel.zip"
    sha256 "4a4a968b98859588e98500ae25973d80a5ca5eed0724222b9f76360dcb72a001"
  end

  def install
    bin.install Dir["ffmpeg"]
  end
end