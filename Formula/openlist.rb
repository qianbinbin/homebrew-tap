class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.0.8"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "6b6bb7389887d5d7d0123d4dda1bce9d973a6dfd0de4ab4ddd3e5e5e0aa56695"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "20bc46929941f6a098ba1dc677864d5c20bde9a05f71669840fd21c51a8298a7"
  end

  depends_on :macos

  def install
    bin.install "openlist"
    generate_completions_from_executable(bin/"openlist", "completion")
  end

  def post_install
    (var/"lib/openlist").mkpath
    (var/"log/openlist").mkpath
    # Fix the stupid file hierarchy
    unless (var/"lib/openlist/config.json").exist?
      pid = Process.spawn bin/"openlist", "server", "--data", var/"lib/openlist", [:out, :err] => "/dev/null"
      sleep 5
      Process.kill "TERM", pid
      sleep 5
      rm var/"lib/openlist/data.db"
      rm_r var/"lib/openlist/temp"
      rm_r var/"lib/openlist/log"
      inreplace var/"lib/openlist/config.json", var/"lib/openlist/log/log.log", var/"log/openlist/access.log"
    end
  end

  def caveats
    <<~EOS
      Data:    #{var}/lib/openlist/
      Config:  #{var}/lib/openlist/config.json
      Logs:    #{var}/log/openlist/
      When run from `brew services`, the initial user and password is in:
        #{var}/log/openlist/error.log
    EOS
  end

  service do
    run [opt_bin/"openlist", "server", "--data", var/"lib/openlist"]
    keep_alive true
    log_path var/"log/openlist/error.log"
    error_log_path var/"log/openlist/error.log"
  end

  test do
    assert_match "Version: v#{version}", shell_output(bin/"openlist version")
  end
end
