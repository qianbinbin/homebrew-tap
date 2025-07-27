class Gh < Formula
  desc "GitHub command-line tool"
  homepage "https://cli.github.com/"
  license "MIT"
  version "2.76.1"

  on_intel do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_amd64.zip"
    sha256 "43a497840a977a8cf7b4ad15cf08d786920b09ac020d53a839b36f2103d6e5de"
  end

  on_arm do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_arm64.zip"
    sha256 "896eb1be25926db57a301859f6f13d65e07c82b26d6eb11a8d7bd3b24220498c"
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
