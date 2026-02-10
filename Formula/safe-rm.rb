class SafeRm < Formula
  desc "A drop-in and much safer replacement of rm"
  homepage "https://github.com/kaelzhang/shell-safe-rm"
  license "MIT"
  head "https://github.com/kaelzhang/shell-safe-rm.git", branch: "master"

  def install
    bin.install "bin/rm.sh" => "rm"
  end
end
