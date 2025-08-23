class Syncthing < Formula
  desc "Open source continuous file synchronization application"
  homepage "https://syncthing.net/"
  license "MPL-2.0"
  version "2.0.3"

  on_intel do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-amd64-v#{version}.zip"
    sha256 "27e5eaf1fe8a3a51ee1da23130b50b17fe8c721b297fbb0eb4b4aa3d1e2b7178"
  end

  on_arm do
    url "https://github.com/syncthing/syncthing/releases/download/v#{version}/syncthing-macos-arm64-v#{version}.zip"
    sha256 "a3748c4e7f7abab19a9ce06e8912772198a0089d7b4caea81a4604d52cb8bf90"
  end

  depends_on :macos
  depends_on macos: :monterey

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
