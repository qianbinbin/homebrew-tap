class Openlist < Formula
  desc "Resilient, community-driven fork of AList"
  homepage "https://oplist.org/"
  license "AGPL-3.0-only"
  version "4.2.1"

  on_intel do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-amd64.tar.gz"
    sha256 "1038bcd19050b283fc889c34dac9a7a471ce083414d4acfa4dd4f96864579bdd"
  end

  on_arm do
    url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-darwin-arm64.tar.gz"
    sha256 "fe277f79e01ef3eec4086d31672a9579f9e29dab34a125120618ac6c56edb029"
  end

  depends_on :macos
  depends_on macos: :monterey

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
end
