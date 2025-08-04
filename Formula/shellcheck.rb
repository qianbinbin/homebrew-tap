class Shellcheck < Formula
  desc "Static analysis and lint tool, for (ba)sh scripts"
  homepage "https://www.shellcheck.net/"
  license "GPL-3.0-or-later"
  version "0.11.0"

  on_intel do
    url "https://github.com/koalaman/shellcheck/releases/download/v#{version}/shellcheck-v#{version}.darwin.x86_64.tar.xz"
    sha256 "3c89db4edcab7cf1c27bff178882e0f6f27f7afdf54e859fa041fca10febe4c6"
  end

  on_arm do
    url "https://github.com/koalaman/shellcheck/releases/download/v#{version}/shellcheck-v#{version}.darwin.aarch64.tar.xz"
    sha256 "56affdd8de5527894dca6dc3d7e0a99a873b0f004d7aabc30ae407d3f48b0a79"
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
