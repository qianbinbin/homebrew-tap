class Yq < Formula
  desc "Process YAML, JSON, XML, CSV and properties documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  license "MIT"
  version "4.47.1"

  on_intel do
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_amd64.tar.gz"
    sha256 "f158283aec894eefc07cc761f594d6ac955dc649714213f3bee0759a5198a272"
  end

  on_arm do
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_arm64.tar.gz"
    sha256 "465bd5bacf957064a51ff4d37cdb4b4d85fc30cb70bf7afdc1720d3789fb5b8d"
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
