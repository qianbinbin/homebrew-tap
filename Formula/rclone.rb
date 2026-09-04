class Rclone < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  license "MIT"
  version "1.75.1"

  on_intel do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip"
    sha256 "29253d0288b8fbbac46baad6e5f6add6cb01d462c79f10805bbd4631c4cdf82c"
  end

  on_arm do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-arm64.zip"
    sha256 "c61d7a371c62bcbbe882c3423aa4b8bf63485c248dd0f692997b8f0c3f6d0c6f"
  end

  depends_on :macos
  on_macos do
    depends_on macos: :ventura
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
