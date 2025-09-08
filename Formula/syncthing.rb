class Syncthing < Formula
  desc "Open source continuous file synchronization application"
  homepage "https://syncthing.net/"
  license "MPL-2.0"
  version "2.0.8"

  on_intel do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-amd64-v#{version}.zip"
    sha256 "3ffd53fee92b07249ce833e5a0730b37b2c6fd3b659635624bdcbaa1217a4610"
  end

  on_arm do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-arm64-v#{version}.zip"
    sha256 "7fed6b0b60f7b15587c3f4c8b7300cc97f506b5e45ef146db667061732b9355c"
  end

  depends_on :macos

  conflicts_with "syncthing", because: "both install `syncthing` binaries"

  def install
    bin.install "syncthing"

    system "curl", "-fsSLO", "https://github.com/syncthing/syncthing/archive/refs/tags/v#{version}.tar.gz"
    system "tar", "-xf", "v#{version}.tar.gz"
    cd "syncthing-#{version}" do
      man1.install Dir["man/*.1"]
      man5.install Dir["man/*.5"]
      man7.install Dir["man/*.7"]
    end
  end

  service do
    run [opt_bin/"syncthing", "--no-browser", "--no-restart"]
    keep_alive true
    log_path var/"log/syncthing.log"
    error_log_path var/"log/syncthing.log"
  end

  test do
    assert_match "syncthing v#{version} ", shell_output("#{bin}/syncthing version")
    system bin/"syncthing", "generate"
  end
end
