class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"
  license "GPL-2.0-or-later"
  version "3.7.0.2"

  on_intel do
    url "https://github.com/jgm/pandoc/releases/download/#{version}/pandoc-#{version}-x86_64-macOS.zip"
    sha256 "5495af2c548bd49fe00c28a7f6dadaa1348e6338b92368d3d6e29fd3e16061d1"
  end

  on_arm do
    url "https://github.com/jgm/pandoc/releases/download/#{version}/pandoc-#{version}-arm64-macOS.zip"
    sha256 "66a579bd8aae83de0bbeba43900953b075a6a3caaa7d1bfc19173e8f95d2ea17"
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
