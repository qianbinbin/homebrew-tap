class Yq < Formula
  desc "Process YAML, JSON, XML, CSV and properties documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  license "MIT"
  version "4.46.1"

  on_intel do
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_amd64.tar.gz"
    sha256 "70cb7b9a6601360de699c789000814e26023bf6b3fbb2454462e5169a4936f03"
  end

  on_arm do
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_arm64.tar.gz"
    sha256 "8f989ef930252bfe9ef054c2202cdf00a84f4f2e06ff1035ca598feee1b2e181"
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
