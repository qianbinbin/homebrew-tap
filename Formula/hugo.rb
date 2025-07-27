class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"
  license "Apache-2.0"
  version "0.148.2"
  url "https://github.com/gohugoio/hugo/releases/download/v#{version}/hugo_extended_withdeploy_#{version}_darwin-universal.tar.gz"
  sha256 "5d2f8862b209ea8d688ad7c5e4cd8a68da77aec81a7692278f2c8e9e31a8d44f"

  depends_on :macos

  conflicts_with "hugo", because: "both install `hugo` binaries"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    system "lipo", "hugo", "-thin", "#{arch}", "-output", "hugo-#{arch}"
    bin.install "hugo-#{arch}" => "hugo"
    generate_completions_from_executable(bin/"hugo", "completion")
    system bin/"hugo", "gen", "man", "--dir", man1
  end

  test do
    site = testpath/"hops-yeast-malt-water"
    system bin/"hugo", "new", "site", site
    assert_path_exists site/"hugo.toml"

    assert_match version.to_s, shell_output(bin/"hugo version")
  end
end
