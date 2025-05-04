class FfmpegOsxexperts < Formula
  desc "FFmpeg static builds from OSXExperts"
  homepage "https://www.osxexperts.net/"

  if Hardware::CPU.arm?
    version "7.1.1"
    url "https://www.osxexperts.net/ffmpeg#{version.to_s.gsub('.', '')}arm.zip"
    sha256 do
      require "open-uri"
      require "digest"
      Digest::SHA256.hexdigest(URI.open(url).read)
    end
  else
    version "7.1"
    url "https://www.osxexperts.net/ffmpeg#{version.to_s.gsub('.', '')}intel.zip"
    sha256 do
      require "open-uri"
      require "digest"
      Digest::SHA256.hexdigest(URI.open(url).read)
    end
  end

  def install
    bin.install Dir["ffmpeg"]
  end
end