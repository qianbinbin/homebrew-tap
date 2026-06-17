class Rclone < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  license "MIT"
  version "1.74.3"

  on_intel do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip"
    sha256 "417cabd402d57806d597bd0ba8fb33a434ca8c2a1a5aa98de5a0bd4b52b39202"
  end

  on_arm do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-arm64.zip"
    sha256 "33a435ab17023b686918ce9a3975aceb75fe1796c694f38f1993024be1f063f5"
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
