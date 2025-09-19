class Tcping < Formula
  desc "Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
  homepage "https://github.com/pouriyajamshidi/tcping"
  license "MIT"
  version "2.7.1"

  on_intel do
    url "https://github.com/pouriyajamshidi/tcping/releases/download/v#{version}/tcping-darwin-amd64-static.tar.gz"
    sha256 "308ebe9b888b014bae486e82dbe63ad638baee3cc90db5a74767ba6a7cd9d54e"
  end

  on_arm do
    url "https://github.com/pouriyajamshidi/tcping/releases/download/v#{version}/tcping-darwin-arm64-static.tar.gz"
    sha256 "a99438cf274e4afcef98808821fadc6f24aea3dfbacc69beb4c0a195e210d327"
  end

  depends_on :macos

  conflicts_with "tcping", because: "both install `tcping` binaries"

  def install
    bin.install "tcping"
  end
end
