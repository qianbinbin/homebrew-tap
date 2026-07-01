class CleanMacDumbs < Formula
  desc "Clean .DS_Store, __MACOSX and ._* files, recursively for directories"
  homepage "https://qianbinbin.github.io/posts/cleaning-dumb-dotfiles-on-macos/"
  license "MIT"
  version "1.1.0"

  url "https://qianbinbin.github.io/posts/cleaning-dumb-dotfiles-on-macos/clean-mac-dumbs-#{version}.tar.gz"
  sha256 "f515105469541caecd9ba5770010832e202253bda1e624456d6ff64a1d032c31"

  depends_on :macos

  def install
    bin.install "clean-mac-dumbs"
    man1.install "clean-mac-dumbs.1"
    bash_completion.install "completion/clean-mac-dumbs"
    zsh_completion.install "completion/_clean-mac-dumbs"
    fish_completion.install "completion/clean-mac-dumbs.fish"
  end

  def caveats
    <<~EOS
      If you need to use it as "clean", add the following to your shell configuration:
        alias clean='clean-mac-dumbs'
    EOS
  end
end
