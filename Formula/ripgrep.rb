class Ripgrep < Formula
  desc "Search tool like grep and The Silver Searcher"
  homepage "https://github.com/BurntSushi/ripgrep"
  license "Unlicense"
  version "14.1.1"

  on_intel do
    url "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "fc87e78f7cb3fea12d69072e7ef3b21509754717b746368fd40d88963630e2b3"
  end

  on_arm do
    url "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "24ad76777745fbff131c8fbc466742b011f925bfa4fffa2ded6def23b5b937be"
  end

  depends_on :macos

  conflicts_with "ripgrep", because: "both install `rg` binaries"

  def install
    bin.install "rg"

    generate_completions_from_executable(bin/"rg", "--generate", shell_parameter_format: "complete-")
    (man1/"rg.1").write Utils.safe_popen_read(bin/"rg", "--generate", "man")
  end

  test do
    (testpath/"Hello.txt").write("Hello World!")
    system bin/"rg", "Hello World!", testpath
  end
end
