class Zellij < Formula
  desc "Pluggable terminal workspace, with terminal multiplexer as the base feature"
  homepage "https://zellij.dev"
  license "MIT"
  version "0.43.0"

  on_intel do
    url "https://github.com/zellij-org/zellij/releases/download/v#{version}/zellij-x86_64-apple-darwin.tar.gz"
    sha256 "d4933b805e127cc60edb77cf9356995863eb484aa014bc2f90804384ce1bb852"
  end

  on_arm do
    url "https://github.com/zellij-org/zellij/releases/download/v#{version}/zellij-aarch64-apple-darwin.tar.gz"
    sha256 "03569f56e3f31d24471128169ba32be476c5dd25b261ae9193645bf7a2e52e7c"
  end

  depends_on :macos

  conflicts_with "zellij", because: "both install `zellij` binaries"

  def install
    bin.install "zellij"
    generate_completions_from_executable(bin/"zellij", "setup", "--generate-completion")
  end

  test do
    assert_match("keybinds", shell_output("#{bin}/zellij setup --dump-config"))
    assert_match("zellij #{version}", shell_output("#{bin}/zellij --version"))
  end
end
