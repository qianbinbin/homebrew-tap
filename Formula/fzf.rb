class Fzf < Formula
  desc "Command-line fuzzy finder written in Go"
  homepage "https://github.com/junegunn/fzf"
  license "MIT"
  version "0.65.0"

  on_intel do
    url "https://github.com/junegunn/fzf/releases/download/v#{version}/fzf-#{version}-darwin_amd64.tar.gz"
    sha256 "202a353f790633455b3a04b7253c6292d8c70e069a5c8cf4766de0d652f74bc5"
  end

  on_arm do
    url "https://github.com/junegunn/fzf/releases/download/v#{version}/fzf-#{version}-darwin_arm64.tar.gz"
    sha256 "9e4dfe01a67020a19861c881fd2ffbb8dd19b118b15e82e8fae83c578ca61ab7"
  end

  depends_on :macos

  conflicts_with "fzf", because: "both install `fzf` executables"

  def install
    bin.install "fzf"

    system "curl", "-fsSLO", "https://github.com/junegunn/fzf/archive/refs/tags/v#{version}.tar.gz"
    system "tar", "-xf", "v#{version}.tar.gz"
    cd "fzf-#{version}" do
      man1.install "man/man1/fzf.1", "man/man1/fzf-tmux.1"
      bin.install "bin/fzf-tmux"
      bin.install "bin/fzf-preview.sh"

      # Please don't install these into standard locations (e.g. `zsh_completion`, etc.)
      # See: https://github.com/Homebrew/homebrew-core/pull/137432
      #      https://github.com/Homebrew/legacy-homebrew/pull/27348
      #      https://github.com/Homebrew/homebrew-core/pull/70543
      prefix.install "install", "uninstall"
      (prefix/"shell").install %w[bash zsh fish].map { |s| "shell/key-bindings.#{s}" }
      (prefix/"shell").install %w[bash zsh].map { |s| "shell/completion.#{s}" }
      (prefix/"plugin").install "plugin/fzf.vim"
    end
  end

  def caveats
    <<~EOS
      To set up shell integration, see:
        https://github.com/junegunn/fzf#setting-up-shell-integration
      To use fzf in Vim, add the following line to your .vimrc:
        set rtp+=#{opt_prefix}
    EOS
  end

  test do
    (testpath/"list").write %w[hello world].join($INPUT_RECORD_SEPARATOR)
    assert_equal "world", pipe_output("#{bin}/fzf -f wld", (testpath/"list").read).chomp
  end
end
