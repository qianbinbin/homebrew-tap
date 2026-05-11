class Tcping < Formula
  desc "Ping TCP ports"
  homepage "https://github.com/pouriyajamshidi/tcping"
  license "MIT"
  version "2.8.0"

  on_intel do
    url "https://github.com/pouriyajamshidi/tcping/releases/download/v#{version}/tcping-darwin-amd64-static.tar.gz"
    sha256 "ad8ba6a1de400c3f50ec997f42a9565e048ee3260b30840654489963908662de"
  end

  on_arm do
    url "https://github.com/pouriyajamshidi/tcping/releases/download/v#{version}/tcping-darwin-arm64-static.tar.gz"
    sha256 "7eed612e549a2c53412d74abf3ac860742e4e7f889cb46fd554e6b96df66d765"
  end

  depends_on :macos

  conflicts_with "tcping", because: "both install `tcping` binaries"

  def install
    bin.install "tcping"
  end
end
