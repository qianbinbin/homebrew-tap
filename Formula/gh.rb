class Gh < Formula
  desc "GitHub command-line tool"
  homepage "https://cli.github.com/"
  license "MIT"
  version "2.78.0"

  on_intel do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_amd64.zip"
    sha256 "324f2647f81a9a23934e8f8a969b10d471c398076d027f2dcf9bdc97931adef1"
  end

  on_arm do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_arm64.zip"
    sha256 "62290b0dbc9965ebbc20d2b481fe83aa167fadc28e0d81a5d93eec6efc9d3b72"
  end

  depends_on :macos

  conflicts_with "gh", because: "both install `fzf` executables"

  deny_network_access! [:postinstall, :test]

  def install
    bin.install "bin/gh"
    man1.install Dir["share/man/man1/gh*.1"]
    generate_completions_from_executable(bin/"gh", "completion", "-s")
  end

  test do
    assert_match "gh version #{version}", shell_output("#{bin}/gh --version")
    assert_match "Work with GitHub issues", shell_output("#{bin}/gh issue 2>&1")
    assert_match "Work with GitHub pull requests", shell_output("#{bin}/gh pr 2>&1")
  end
end
