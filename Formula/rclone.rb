class Rclone < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  license "MIT"
  version "1.73.2"

  on_intel do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip"
    sha256 "ff3215b1b93e4588e0ccfef11e4c49755a91d42f4bc89c98bf89f6d30b0ae16f"
  end

  on_arm do
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-arm64.zip"
    sha256 "879fd46e0338bf6244f55af6bde9f151a1711dd62abdc46117a4c11cfb0a601e"
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
