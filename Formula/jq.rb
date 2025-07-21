class Jq < Formula
  desc "Lightweight and flexible command-line JSON processor"
  homepage "https://jqlang.github.io/jq/"
  license "MIT"
  version "1.8.1"

  on_intel do
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-macos-amd64"
    sha256 "e80dbe0d2a2597e3c11c404f03337b981d74b4a8504b70586c354b7697a7c27f"
  end

  on_arm do
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-macos-arm64"
    sha256 "a9fe3ea2f86dfc72f6728417521ec9067b343277152b114f4e98d8cb0e263603"
  end

  depends_on :macos

  conflicts_with "jq", because: "both install `jq` binaries"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "jq-macos-#{arch}" => "jq"
    system "curl", "-fsSLO", "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-#{version}.tar.gz"
    system "tar", "-xf", "jq-#{version}.tar.gz"
    man1.install "jq-#{version}/jq.1"
  end

  test do
    assert_equal "2\n", pipe_output("#{bin}/jq .bar", '{"foo":1, "bar":2}')
  end
end
