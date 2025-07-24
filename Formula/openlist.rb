class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.0.9"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "591bcf502fb1135ed5f3339e1d3d6cd15fab3725648ab609805cf988d8e9137f"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "ecc3b28bf9f90a5fe7aae789814e477b31436b64962cfc6a40cef858fe759a83"
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
