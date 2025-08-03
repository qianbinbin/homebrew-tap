class Fzf < Formula
  desc "Command-line fuzzy finder written in Go"
  homepage "https://github.com/junegunn/fzf"
  license "MIT"
  version "0.65.1"

  on_intel do
    url "https://github.com/junegunn/fzf/releases/download/v#{version}/fzf-#{version}-darwin_amd64.tar.gz"
    sha256 "818c58844a200926b58391810c30be0c9f83822ad6e224fab9ee6e8b7e60c836"
  end

  on_arm do
    url "https://github.com/junegunn/fzf/releases/download/v#{version}/fzf-#{version}-darwin_arm64.tar.gz"
    sha256 "2fc1de9545e49efce63a7c1f8cd2616c0c112478867d5a99e5b24570038a57a1"
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
