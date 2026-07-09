class Rclone < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  license "MIT"
  version "1.74.4"

  on_intel do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip"
    sha256 "4188aa84043d7a6240912923f47639a9d2da21f3b40a521c065c8d92e66563f6"
  end

  on_arm do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-arm64.zip"
    sha256 "c2100e2d4a4b3be04c55cd45380cafe7647e1ad772bb055f52f00876ed701167"
  end

  depends_on :macos
  on_macos do
    depends_on macos: :monterey
  end

  conflicts_with "rclone", because: "both install `rclone` binaries"

  def install
    bin.install "rclone"
    man1.install "rclone.1"
    system bin/"rclone", "genautocomplete", "bash", "rclone.bash"
    system bin/"rclone", "genautocomplete", "zsh", "_rclone"
    system bin/"rclone", "genautocomplete", "fish", "rclone.fish"
    bash_completion.install "rclone.bash" => "rclone"
    zsh_completion.install "_rclone"
    fish_completion.install "rclone.fish"
  end

  def post_install
    # Fix "no route to host" issue, aka local network privacy on macOS >= 15
    if Hardware::CPU.intel? && MacOS.version >= :sequoia && !quiet_system("codesign", "-v", bin/"rclone")
      ohai "Binary not signed, applying ad-hoc signature..."
      system "codesign", "--sign", "-", bin/"rclone"
    end
  end

  def caveats
    <<~EOS
      I (the maintainer of this tap) have switched to MacPorts, and this formula will be automatically updated by CI/CD.

      Use it at your own risk.
    EOS
  end
end
