class Rclone < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  license "MIT"
  version "1.75.2"

  on_intel do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip"
    sha256 "574e1f31cf1c464e5fb0325cb66fcbdeaf1efa1802bd9b17f13c256fd74b6561"
  end

  on_arm do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-arm64.zip"
    sha256 "610ab7d48615135dfc60b763858b11a426a0d3d1160c1bb76fb0ae6011b02edd"
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
