# Homebrew cask for Defaultify for Mac.
# Lives in the tap repo github.com/restartv1/homebrew-tap as Casks/defaultify.rb, so users can run:
#   brew install restartv1/tap/defaultify
# scripts/publish.sh fills in version and sha256 and pushes it to the tap for each release.
cask "defaultify" do
  version "1.1.1"
  sha256 "04dedf38002102533453160e5136658e499e4229b0e6308c00248fc26e3c7f5d"

  url "https://defaultify.app/downloads/mac/Defaultify-#{version}.dmg"
  name "Defaultify"
  desc "Choose which app opens every file type and link"
  homepage "https://defaultify.app/mac/"

  livecheck do
    url "https://defaultify.app/updates/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: ">= :sonoma"

  app "Defaultify.app"

  zap trash: [
    "~/Library/Application Support/Defaultify",
    "~/Library/Preferences/com.circuitandmosslabs.defaultify.mac.plist",
  ]
end
