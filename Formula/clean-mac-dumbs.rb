class CleanMacDumbs < Formula
  desc "Clean .DS_Store, __MACOSX and ._* files, recursively for directories"
  homepage "https://qianbinbin.github.io/posts/cleaning-dumb-dotfiles-on-macos/"
  license "MIT"
  version "1.0"

  url "https://qianbinbin.github.io/posts/cleaning-dumb-dotfiles-on-macos/clean-mac-dumbs-#{version}.tar.gz"
  sha256 "6da2c0a1add6a058581b061cdead3041b08a018a5154b84242b8e5afac90a42f"

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
      If you need to use it as "clean", add the following to your shell profile e.g. ~/.profile or ~/.zshrc:
        alias clean='clean-mac-dumbs'
    EOS
  end

end
