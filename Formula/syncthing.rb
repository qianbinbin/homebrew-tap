class Syncthing < Formula
  desc "Open source continuous file synchronization application"
  homepage "https://syncthing.net/"
  license "MPL-2.0"
  version "2.0.9"

  on_intel do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-amd64-v#{version}.zip"
    sha256 "1dd9dfb13564afc5f8349c1c159d6433cd86e3ace8e65dcd72d3222e569dc7e0"
  end

  on_arm do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-arm64-v#{version}.zip"
    sha256 "2fc3dc1cb8ea690adf05ba5599788584bc084ff3e13a4486a0d3578c9ecaaf28"
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
