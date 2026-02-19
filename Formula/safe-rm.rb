class SafeRm < Formula
  desc "A drop-in and much safer replacement of rm"
  homepage "https://github.com/kaelzhang/shell-safe-rm"
  license "MIT"
  head "https://github.com/kaelzhang/shell-safe-rm.git", branch: "master"

  conflicts_with "safe-rm", because: "both install `safe-rm` binaries"

  def install
    bin.install "bin/rm.sh" => "safe-rm"
  end

  def caveats
    <<~EOS
      To use it as "rm", add the following to your shell profile e.g. ~/.profile or ~/.zshrc:
        alias rm='safe-rm'
    EOS
  end
end
