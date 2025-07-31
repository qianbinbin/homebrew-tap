class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.1.0"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "f360fd29f0ed00ad24b4668dfaee2258dc8efe5cd5b8d03b3418d865bd279fd1"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "89421fb06ff5d36cdd04245b7f8f8ba896b30dd4a75f50a42f2a62ccedbd6170"
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
