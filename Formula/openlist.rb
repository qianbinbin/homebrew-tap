class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.0.9"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "a73ae04e2d3f170a7db0bd22f4036a6ee7371edea67c607f166b68794c3fcb68"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "dc318b05eaa11dbfa7bd402677196f66e9d0e2cb7b2906dbd28b62194ae51537"
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

      When run from `brew services`, the initial user and password is in:
        #{var}/log/openlist/error.log
    EOS
  end

  service do
    run [opt_bin/"openlist", "server", "--data", var/"lib/openlist"]
    keep_alive true
    log_path var/"log/openlist/error.log"
    error_log_path var/"log/openlist/error.log"
    environment_variables OPENLIST_LOG_NAME: var/"log/openlist/access.log"
  end

  test do
    assert_match "Version: v#{version}", shell_output(bin/"openlist version")
  end
end
