class Syncthing < Formula
  desc "Open source continuous file synchronization application"
  homepage "https://syncthing.net/"
  license "MPL-2.0"
  version "1.30.0"

  on_intel do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-amd64-v#{version}.zip"
    sha256 "eb375302c79b89b85f32f014e451430efe3a9723b37639698310344a9029799e"
  end

  on_arm do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-arm64-v#{version}.zip"
    sha256 "dd42cc7a88d08779c305e5f6f2d8bc8dec2c97652c1380679c672d4febd63f8f"
  end

  depends_on :macos

  conflicts_with "syncthing", because: "both install `syncthing` binaries"

  def install
    bin.install "syncthing"

    system "curl", "-fsSLO", "https://github.com/syncthing/syncthing/archive/refs/tags/v#{version}.tar.gz"
    system "tar", "-xf", "v#{version}.tar.gz"
    man1.install Dir["syncthing-#{version}/man/*.1"]
    man5.install Dir["syncthing-#{version}/man/*.5"]
    man7.install Dir["syncthing-#{version}/man/*.7"]
  end

  service do
    run [opt_bin/"syncthing", "-no-browser", "-no-restart"]
    keep_alive true
    log_path var/"log/syncthing.log"
    error_log_path var/"log/syncthing.log"
  end

  test do
    assert_match "syncthing v#{version} ", shell_output("#{bin}/syncthing --version")
    system bin/"syncthing", "-generate", "./"
  end
end
