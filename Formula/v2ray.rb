class V2ray < Formula
  desc "Platform for building proxies to bypass network restrictions"
  homepage "https://v2fly.org/"
  license all_of: ["MIT", "CC-BY-SA-4.0"]
  version "5.37.0"

  on_intel do
    url "https://github.com/v2fly/v2ray-core/releases/download/v#{version}/v2ray-macos-64.zip"
    sha256 "4723b46bd9b47595f20308f2593dd25c36426f096c82346e8d5b44275b78f7a0"
  end

  on_arm do
    url "https://github.com/v2fly/v2ray-core/releases/download/v#{version}/v2ray-macos-arm64-v8a.zip"
    sha256 "e6ad913b6d7196a0e99d053f8477d6ebdded3530fb89a51bde5512954acda653"
  end

  depends_on :macos

  conflicts_with "v2ray", because: "both install `v2ray` binaries"

  def install
    libexec.install "v2ray"
    (bin/"v2ray").write_env_script libexec/"v2ray",
      V2RAY_LOCATION_ASSET: "${V2RAY_LOCATION_ASSET:-#{pkgshare}}"

    pkgetc.install "config.json"
    pkgshare.install "geoip.dat"
    pkgshare.install "geoip-only-cn-private.dat"
    pkgshare.install "geosite.dat"
  end

  service do
    run [opt_bin/"v2ray", "run", "-config", etc/"v2ray/config.json"]
    keep_alive true
  end

  test do
    (testpath/"config.json").write <<~JSON
      {
        "log": {
          "access": "#{testpath}/log"
        },
        "outbounds": [
          {
            "protocol": "freedom",
            "tag": "direct"
          }
        ],
        "routing": {
          "rules": [
            {
              "ip": [
                "geoip:private"
              ],
              "outboundTag": "direct",
              "type": "field"
            },
            {
              "domains": [
                "geosite:private"
              ],
              "outboundTag": "direct",
              "type": "field"
            }
          ]
        }
      }
    JSON
    output = shell_output "#{bin}/v2ray test -c #{testpath}/config.json"

    assert_match "Configuration OK", output
    assert_path_exists testpath/"log"
  end
end
