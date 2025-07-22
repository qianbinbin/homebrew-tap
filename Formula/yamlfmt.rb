class Yamlfmt < Formula
  desc "Extensible command-line tool to format YAML files"
  homepage "https://github.com/google/yamlfmt"
  license "Apache-2.0"
  version "0.17.2"

  on_intel do
    url "https://github.com/google/yamlfmt/releases/download/v#{version}/yamlfmt_#{version}_Darwin_x86_64.tar.gz"
    sha256 "e806fe1013e601788e762dc7e54858b0bb4bdc828c5b4c95125db67cd997ac30"
  end

  on_arm do
    url "https://github.com/google/yamlfmt/releases/download/v#{version}/yamlfmt_#{version}_Darwin_arm64.tar.gz"
    sha256 "94bd3fb3a2c66bdab77b58cd91bece9e4a8a28a33cb4e0fe241e6220548f69dd"
  end

  depends_on :macos

  conflicts_with "yamlfmt", because: "both install `yamlfmt` executables"

  def install
    bin.install "yamlfmt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yamlfmt -version")

    (testpath/"test.yml").write <<~YAML
      foo: bar
    YAML
    system bin/"yamlfmt", "-lint", "test.yml"
  end
end
