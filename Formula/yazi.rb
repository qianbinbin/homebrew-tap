class Yazi < Formula
  desc "Blazing fast terminal file manager written in Rust, based on async I/O"
  homepage "https://github.com/sxyazi/yazi"
  license "MIT"
  version "25.5.31"

  on_intel do
    url "https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-apple-darwin.zip"
    sha256 "2aaf4d7427914877596476242cbf1a5bdf7796a6002a0d3034a5506ca54f813b"
  end

  on_arm do
    url "https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-aarch64-apple-darwin.zip"
    sha256 "8bdf137e8f84cd11f9dd866ff2b68e4886d1055ab21fe2e0c6f6a0515d2bfd70"
  end

  depends_on :macos

  conflicts_with "yazi", because: "both install `ya` and `yazi` binaries"

  def install
    bin.install "ya", "yazi"

    bash_completion.install "completions/yazi.bash" => "yazi"
    zsh_completion.install "completions/_yazi"
    fish_completion.install "completions/yazi.fish"

    bash_completion.install "completions/ya.bash" => "ya"
    zsh_completion.install "completions/_ya"
    fish_completion.install "completions/ya.fish"
  end

  test do
    # yazi is a GUI application
    assert_match "Yazi #{version}", shell_output("#{bin}/yazi --version").strip
  end
end
