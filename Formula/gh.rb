class Gh < Formula
  desc "GitHub command-line tool"
  homepage "https://cli.github.com/"
  license "MIT"
  version "2.76.2"

  on_intel do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_amd64.zip"
    sha256 "a8d27429a00f50ae3318fc75a9ed1e8400932c109a657e1570467eab76f6c419"
  end

  on_arm do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_arm64.zip"
    sha256 "43cea90fbd5d3b607b6125082f4a5faf7d5fc2e548d3d349a3b0310706a4f878"
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
