class Gh < Formula
  desc "GitHub command-line tool"
  homepage "https://cli.github.com/"
  license "MIT"
  version "2.79.0"

  on_intel do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_amd64.zip"
    sha256 "c1672616fcb3745a0e4285110143b1cc93c241bd867bf108084defdea3d49331"
  end

  on_arm do
    url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_macOS_arm64.zip"
    sha256 "5454f9509e3dbb8f321310e9e344877d9a01ebb8f8703886b1afb0936d60ffaa"
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
