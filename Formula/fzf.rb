class Fzf < Formula
  desc "Command-line fuzzy finder written in Go"
  homepage "https://github.com/junegunn/fzf"
  license "MIT"
  version "0.64.0"

  on_intel do
    url "https://github.com/junegunn/fzf/releases/download/v#{version}/fzf-#{version}-darwin_amd64.tar.gz"
    sha256 "9fb8180bbd1bb06af4e3f7bc8e8f8e84b3fde12297d6e187dd699a4f620042bb"
  end

  on_arm do
    url "https://github.com/junegunn/fzf/releases/download/v#{version}/fzf-#{version}-darwin_arm64.tar.gz"
    sha256 "c71d2528e090de5d4765017d745f8a4fed44b43703f93247a28f6dc2aa4c7c01"
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
