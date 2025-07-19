class Shfmt < Formula
  desc "Autoformat shell script source code"
  homepage "https://github.com/mvdan/sh"
  license "BSD-3-Clause"
  version "3.12.0"

  on_intel do
    url "https://github.com/mvdan/sh/releases/download/v#{version}/shfmt_v#{version}_darwin_amd64"
    sha256 "c31548693de6584e6164b7ed5fbb7b4a083f2d937ca94b4e0ddf59aa461a85e4"
  end

  on_arm do
    url "https://github.com/mvdan/sh/releases/download/v#{version}/shfmt_v#{version}_darwin_arm64"
    sha256 "d903802e0ce3ecbc82b98512f55ba370b0d37a93f3f78de394f5b657052b33dd"
  end

  # NOTE: #{version} is not available in resource block
  # resource "source" do
  #   url "https://github.com/mvdan/sh/raw/refs/tags/v#{version}/cmd/shfmt/shfmt.1.scd"
  # end

  depends_on "scdoc" => :build
  depends_on :macos

  conflicts_with "shfmt", because: "both install `shfmt` binaries"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "shfmt_v#{version}_darwin_#{arch}" => "shfmt"
    man1.mkpath
    system "curl -fsSL --retry 3 https://github.com/mvdan/sh/raw/refs/tags/v#{version}/cmd/shfmt/shfmt.1.scd | scdoc >#{man1}/shfmt.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shfmt --version")

    (testpath/"test").write "\t\techo foo"
    system bin/"shfmt", testpath/"test"
  end
end
