class Zellij < Formula
  desc "Pluggable terminal workspace, with terminal multiplexer as the base feature"
  homepage "https://zellij.dev"
  license "MIT"
  version "0.42.2"

  on_intel do
    url "https://github.com/zellij-org/zellij/releases/download/v#{version}/zellij-x86_64-apple-darwin.tar.gz"
    sha256 "4a848ad2880e446dc04c1cd4da563e88e0a30e94bc79d135cdd1841a8abe9755"
  end

  on_arm do
    url "https://github.com/zellij-org/zellij/releases/download/v#{version}/zellij-aarch64-apple-darwin.tar.gz"
    sha256 "a93c3b9d26580b66615d630539a7dcd976ec021565526b4ded97698ddb38ee42"
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
