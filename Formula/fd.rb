class Fd < Formula
  desc "Simple, fast and user-friendly alternative to find"
  homepage "https://github.com/sharkdp/fd"
  license any_of: ["Apache-2.0", "MIT"]
  version "10.2.0"

  on_intel do
    url "https://github.com/sharkdp/fd/releases/download/v#{version}/fd-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "991a648a58870230af9547c1ae33e72cb5c5199a622fe5e540e162d6dba82d48"
  end

  on_arm do
    url "https://github.com/sharkdp/fd/releases/download/v#{version}/fd-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "ae6327ba8c9a487cd63edd8bddd97da0207887a66d61e067dfe80c1430c5ae36"
  end

  depends_on :macos

  conflicts_with "fd", because: "both install `fd` binaries"
  conflicts_with "fdclone", because: "both install `fd` binaries"

  def install
    bin.install "fd"

    generate_completions_from_executable(bin/"fd", "--gen-completions", shells: [:bash, :fish, :pwsh])
    zsh_completion.install "autocomplete/_fd"
    man1.install "fd.1"
  end

  test do
    touch "foo_file"
    touch "test_file"
    assert_equal "test_file", shell_output("#{bin}/fd test").chomp
  end
end
