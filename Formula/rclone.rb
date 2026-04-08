class Rclone < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  license "MIT"
  version "1.73.4"

  on_intel do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip"
    sha256 "4ef15279d857372f3ff84b967ad68fc1c3b113d631effb9c09a18e40f8a78fa7"
  end

  on_arm do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-arm64.zip"
    sha256 "8cfffacc3ce732b1960645a2f7d2ce97c2ac9ba4f2221c13af6378c199a078f9"
  end

  depends_on :macos
  depends_on macos: :monterey

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
    if Hardware::CPU.intel? && MacOS.version >= :sequoia
      system "codesign", "--sign", "-", bin/"rclone"
    end
  end
end
