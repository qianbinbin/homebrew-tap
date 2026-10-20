class Advcpmv < Formula
  desc "Add progress bar for GNU Core Utilities cp and mv"
  homepage "https://github.com/jarun/advcpmv"
  head "https://github.com/jarun/advcpmv.git", branch: "master"

  def install
    advcpmv_version = File.read("install.sh")[/\s*ADVCPMV_VERSION=\$\{1:-(.+)\}$/, 1]
    coreutils_version = File.read("install.sh")[/\s*CORE_UTILS_VERSION=\$\{2:-(.+)\}$/, 1]
    system "curl", "-LO", "https://ftp.gnu.org/gnu/coreutils/coreutils-#{coreutils_version}.tar.xz"
    system "tar", "-xf", "coreutils-#{coreutils_version}.tar.xz"
    cd "coreutils-#{coreutils_version}" do
      patch = "../advcpmv-#{advcpmv_version}-#{coreutils_version}.patch"
      ohai "Removing .texi blocks in #{patch}"
      File.write(patch, File.read(patch).gsub(/^[ \t]*--- .*\.texi.*(?:\n(?!---).*)*\n?/, ""))

      system "patch", "-p1", "-i", patch
      system "./configure"
      system "make"
      bin.install Dir["src/{cp,mv}"]
      man1.install Dir["man/{cp,mv}.1"]
    end
  end

  def caveats
    <<~EOS
      The 'cp' and 'mv' executable has been installed.
      You can add aliases to your shell configuration:

        alias cp='cp -g'
        alias mv='mv -g'
    EOS
  end
end
