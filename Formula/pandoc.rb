class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"
  license "GPL-2.0-or-later"
  version "3.8"

  on_intel do
    url "https://github.com/jgm/pandoc/releases/download/#{version}/pandoc-#{version}-x86_64-macOS.zip"
    sha256 "07a7fb7db6346710f3c9b06e6eb0ce49a66afa0d1969aa0158ecb14d9eaecb20"
  end

  on_arm do
    url "https://github.com/jgm/pandoc/releases/download/#{version}/pandoc-#{version}-arm64-macOS.zip"
    sha256 "7cfaa04a57816397dd6498fd50ada01bdeb04feefab737da37d493fb30131533"
  end

  depends_on :macos

  conflicts_with "pandoc", because: "both install `pandoc` binaries"

  def install
    bin.install "bin/pandoc"
    generate_completions_from_executable(bin/"pandoc", "--bash-completion",
                                         shells: [:bash], shell_parameter_format: :none)
    man1.install "share/man/man1/pandoc.1"
  end

  test do
    input_markdown = <<~MARKDOWN
      # Homebrew

      A package manager for humans. Cats should take a look at Tigerbrew.
    MARKDOWN
    expected_html = <<~HTML
      <h1 id="homebrew">Homebrew</h1>
      <p>A package manager for humans. Cats should take a look at
      Tigerbrew.</p>
    HTML
    assert_equal expected_html, pipe_output("#{bin}/pandoc -f markdown -t html5", input_markdown, 0)
  end
end
