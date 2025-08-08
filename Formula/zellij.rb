class Zellij < Formula
  desc "Pluggable terminal workspace, with terminal multiplexer as the base feature"
  homepage "https://zellij.dev"
  license "MIT"
  version "0.43.1"

  on_intel do
    url "https://github.com/zellij-org/zellij/releases/download/v#{version}/zellij-x86_64-apple-darwin.tar.gz"
    sha256 "7b0c1a9c2591eadf506ec58d62ef5f6d9c93d089a3603142af3dcca5fa575d44"
  end

  on_arm do
    url "https://github.com/zellij-org/zellij/releases/download/v#{version}/zellij-aarch64-apple-darwin.tar.gz"
    sha256 "a09ea51f3d98427253de2b889bb04f1aa0850fbb034911c7a01b8f0194edba66"
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
