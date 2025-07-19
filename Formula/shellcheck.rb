class Shellcheck < Formula
  desc "Static analysis and lint tool, for (ba)sh scripts"
  homepage "https://www.shellcheck.net/"
  license "GPL-3.0-or-later"
  version "0.10.0"

  on_intel do
    url "https://github.com/koalaman/shellcheck/releases/download/v#{version}/shellcheck-v#{version}.darwin.x86_64.tar.xz"
    sha256 "ef27684f23279d112d8ad84e0823642e43f838993bbb8c0963db9b58a90464c2"
  end

  on_arm do
    url "https://github.com/koalaman/shellcheck/releases/download/v#{version}/shellcheck-v#{version}.darwin.aarch64.tar.xz"
    sha256 "bbd2f14826328eee7679da7221f2bc3afb011f6a928b848c80c321f6046ddf81"
  end

  depends_on "qianbinbin/tap/pandoc" => :build
  depends_on :macos

  conflicts_with "shellcheck", because: "both install `shellcheck` binaries"

  def install
    bin.install "shellcheck"
    system "curl -fsSL --retry 3 https://github.com/koalaman/shellcheck/raw/refs/tags/v#{version}/shellcheck.1.md | pandoc -s -f markdown-smart -t man -o shellcheck.1"
    man1.install "shellcheck.1"
  end

  test do
    sh = testpath/"test.sh"
    sh.write <<~SH
      for f in $(ls *.wav)
      do
        echo "$f"
      done
    SH
    assert_match "[SC2045]", shell_output("#{bin}/shellcheck -f gcc #{sh}", 1)
  end
end
