class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.2.8"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "da46799a9729a31d1f1d28530d3276cb8498689c7b986d715433544b64926de0"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "c845f509d784a936ce53610c5643cedd05223e42ceb63fce5ad1bacbca1bbcd7"
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
