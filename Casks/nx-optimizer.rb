cask "nx-optimizer" do
  version "3.1.6"
  arc = Hardware::CPU.intel? ? "Intel" : "Silicon"
  url "https://github.com/MaxLastBreath/nx-optimizer/releases/download/manager-#{version}/NX_Optimizer_#{version}_MacOS_#{arc}.zip"
  name "nx-optimizer"
  desc "NX-Optimizer (Known As TOTK-Optimizer) is a Mod Manager for UltraCam, a code injection mod for the following Games: \rThe Legend of Zelda: Tears of the Kingdom, Breath Of The Wild, Echoes Of Wisdom, Link's Awakening and More"
  homepage "https://github.com/MaxLastBreath/nx-optimizer"

  app "NX Optimizer.app"

end
