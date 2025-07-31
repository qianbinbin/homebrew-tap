class Zoxide < Formula
  desc "Shell extension to navigate your filesystem faster"
  homepage "https://github.com/ajeetdsouza/zoxide"
  license "MIT"
  version "0.9.8"

  on_intel do
    url "https://github.com/ajeetdsouza/zoxide/releases/download/v#{version}/zoxide-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "cfa865ffd1ba87df2962f40ebd80c366f1d2b484f0c05b6da6b0104f50822f86"
  end

  on_arm do
    url "https://github.com/ajeetdsouza/zoxide/releases/download/v#{version}/zoxide-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "3d1ec4af7f3d351629f500b432e6c735caf3216ab3eaa76dbe8ffbc8f3006f5a"
  end

  depends_on :macos

  conflicts_with "zoxide", because: "both install `zoxide` binaries"

  def install
    bin.install "zoxide"

    bash_completion.install "completions/zoxide.bash" => "zoxide"
    zsh_completion.install "completions/_zoxide"
    fish_completion.install "completions/zoxide.fish"
    share.install "man"
  end

  test do
    assert_empty shell_output("#{bin}/zoxide add /").strip
    assert_equal "/", shell_output("#{bin}/zoxide query").strip
  end
end
