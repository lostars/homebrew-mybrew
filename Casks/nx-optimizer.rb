cask "nx-optimizer" do
  version "3.2.0"
  sha256 "452d0d74c2e075a573acbcb3718f7fa41bb4deb6851c11db6f7a3e0314e411d5"
  arc = Hardware::CPU.intel? ? "Intel" : "Silicon"
  url "https://github.com/MaxLastBreath/nx-optimizer/releases/download/manager-#{version}/NX_Optimizer_#{version}_MacOS_#{arc}.zip"
  name "nx-optimizer"
  desc "NX-Optimizer (Known As TOTK-Optimizer) is a Mod Manager for UltraCam, a code injection mod for the following Games: The Legend of Zelda: Tears of the Kingdom, Breath Of The Wild, Echoes Of Wisdom, Link's Awakening and More"
  homepage "https://github.com/MaxLastBreath/nx-optimizer"
  depends_on :macos

  app "NX Optimizer.app"

end
