class Fd < Formula
  desc "Simple, fast and user-friendly alternative to find"
  homepage "https://github.com/sharkdp/fd"
  license any_of: ["Apache-2.0", "MIT"]
  version "10.3.0"

  on_intel do
    url "https://github.com/sharkdp/fd/releases/download/v#{version}/fd-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "50d30f13fe3d5914b14c4fff5abcbd4d0cdab4b855970a6956f4f006c17117a3"
  end

  on_arm do
    url "https://github.com/sharkdp/fd/releases/download/v#{version}/fd-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "0570263812089120bc2a5d84f9e65cd0c25e4a4d724c80075c357239c74ae904"
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
