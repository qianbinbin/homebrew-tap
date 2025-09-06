class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.1.2"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "5ac35aa2caf2c408c59077bee8bf86252568b6548768d53c0b8096e537ae7706"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "d2da54d1fccc7a47639409dc1f5809601f7e74204a1787046e771b9a9f6099db"
  end

  depends_on :macos

  def install
    bin.install "openlist"
    generate_completions_from_executable(bin/"openlist", "completion")
  end

  def post_install
    (var/"lib/openlist").mkpath
    (var/"log/openlist").mkpath
  end

  def caveats
    <<~EOS
      Data:    #{var}/lib/openlist/
      Config:  #{var}/lib/openlist/config.json
      Logs:    #{var}/log/openlist/

      When run from `brew services`, the server runs at:
        http://localhost:5244
      The initial user and password is in:
        #{var}/log/openlist/error.log

      Quick start:
        https://doc.oplist.org/guide
    EOS
  end

  service do
    run [opt_bin/"openlist", "server", "--data", var/"lib/openlist"]
    keep_alive true
    log_path var/"log/openlist/error.log"
    error_log_path var/"log/openlist/error.log"
    environment_variables OPENLIST_LOG_NAME: var/"log/openlist/access.log",
      OPENLIST_ADDR: "localhost"
  end

  test do
    assert_match "Version: v#{version}", shell_output(bin/"openlist version")
  end
end
