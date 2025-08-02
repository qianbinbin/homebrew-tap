class Bat < Formula
  desc "Clone of cat(1) with syntax highlighting and Git integration"
  homepage "https://github.com/sharkdp/bat"
  license any_of: ["Apache-2.0", "MIT"]
  version "0.25.0"

  on_intel do
    url "https://github.com/sharkdp/bat/releases/download/v#{version}/bat-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "b974aa834b6b65610090aed2bc7310d11c6f500105696d23a130aee24fd8380f"
  end

  on_arm do
    url "https://github.com/sharkdp/bat/releases/download/v#{version}/bat-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "b3ed5a7515545445881f1036f0cc1b708c2b86cbce01c1b4033f38e0cfcc7b3c"
  end

  depends_on :macos

  conflicts_with "bat", because: "both install `bat` binaries"

  def install
    bin.install "bat"

    man1.install "bat.1"
    generate_completions_from_executable(bin/"bat", "--completion")
  end

  test do
    require "utils/linkage"

    pdf = test_fixtures("test.pdf")
    output = shell_output("#{bin}/bat #{pdf} --color=never")
    assert_match "Homebrew test", output

    [
      Formula["libgit2"].opt_lib/shared_library("libgit2"),
      Formula["oniguruma"].opt_lib/shared_library("libonig"),
    ].each do |library|
      assert Utils.binary_linked_to_library?(bin/"bat", library),
        "No linkage with #{library.basename}! Cargo is likely using a vendored version."
    end
  end
end
