class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"
  license "Apache-2.0"
  version "0.148.1"
  url "https://github.com/gohugoio/hugo/releases/download/v#{version}/hugo_extended_withdeploy_#{version}_darwin-universal.tar.gz"
  sha256 "36e48aaf2e33078c2fab193cd035d2be4c5b394f37dc9592c538a9974bb156ac"

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
