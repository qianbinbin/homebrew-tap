class Tlrc < Formula
  desc "Official tldr client written in Rust"
  homepage "https://tldr.sh/tlrc/"
  license "MIT"
  version "1.11.1"

  url "https://github.com/tldr-pages/tlrc/releases/download/v#{version}/tlrc-v#{version}-x86_64-apple-darwin.tar.gz"
  sha256 "6c20c1263c3eed9f9ecfd84461e1b9060af89874fa91541d910f41add6eb00fb"

  depends_on :macos
  depends_on arch: :x86_64

  conflicts_with "tealdeer", because: "both install `tldr` binaries"
  conflicts_with "tldr", because: "both install `tldr` binaries"
  conflicts_with "tlrc", because: "both install `tlrc` binaries"

  def install
    bin.install "tldr"
    man1.install "tldr.1"
    bash_completion.install "completions/tldr.bash" => "tldr"
    zsh_completion.install "completions/_tldr"
    fish_completion.install "completions/tldr.fish"
  end

  test do
    assert_match "brew", shell_output("#{bin}/tldr brew")
  end
end
