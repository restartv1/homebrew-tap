# Homebrew cask for Defaultify for Mac.
# Lives in the tap repo github.com/restartv1/homebrew-tap as Casks/defaultify.rb, so users can run:
#   brew install restartv1/tap/defaultify
# scripts/publish.sh fills in version and sha256 and pushes it to the tap for each release.
cask "defaultify" do
  version "1.0.0"
  sha256 "04ca675f273bf4cfcb2268c540c01265dc39d3215f3ded1f998a25482a3a2dfb"

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
