class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.2.7"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "eddf6c063ce3afdb46f11a95f1e018cedd425c6914255b2edcd90e37b4a07edd"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "85c50a526a540ccb80c83dc4007e6863e7897d23b0c26fb4dac52d3dbc603ac0"
  end

  depends_on :macos
  on_macos do
    depends_on macos: :ventura
  end

  def install
    bin.install "openlist"
    generate_completions_from_executable(bin/"openlist", "completion")

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
end
