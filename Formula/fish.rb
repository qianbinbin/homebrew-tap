class Fish < Formula
  desc "User-friendly command-line shell for UNIX-like operating systems"
  homepage "https://fishshell.com"
  license "GPL-2.0-only"
  version "4.7.1"
  url "https://github.com/fish-shell/fish-shell/releases/download/#{version}/fish-#{version}.pkg"
  sha256 "19b8b8237f6a59f6e728b00f43c18cfa5b0ee367ba7626049e35319ee4080559"

  depends_on :macos

  conflicts_with "fish", because: "both install `fish` binaries"

  def install
    system "xar", "-xf", "fish-#{version}.pkg"
    system "cpio -idm < fish.pkg/Payload"
    prefix.install Dir["usr/local/*"]
  end

  def post_install
    (pkgshare/"vendor_functions.d").mkpath
    (pkgshare/"vendor_completions.d").mkpath
    (pkgshare/"vendor_conf.d").mkpath
  end
end
