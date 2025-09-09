class Yq < Formula
  desc "Process YAML, JSON, XML, CSV and properties documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  license "MIT"
  version "4.47.2"

  on_intel do
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_amd64.tar.gz"
    sha256 "2ba21df4a67b3c79b17c288c93b645236fb2f90d19b8d17074dffff561bf69e2"
  end

  on_arm do
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_arm64.tar.gz"
    sha256 "5ffd1ee37cc0c805d17467371f94ec13c52066edf9c3e374ed783a283b7ac769"
  end

  depends_on :macos

  conflicts_with "yq", because: "both install `yq` executables"
  conflicts_with "python-yq", because: "both install `yq` executables"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "yq_darwin_#{arch}" => "yq"
    generate_completions_from_executable(bin/"yq", "completion")
    man1.install "yq.1"
  end

  test do
    assert_equal "key: cat", shell_output("#{bin}/yq eval --null-input --no-colors '.key = \"cat\"'").chomp
    assert_equal "cat", pipe_output("#{bin}/yq eval \".key\" -", "key: cat", 0).chomp
  end
end
