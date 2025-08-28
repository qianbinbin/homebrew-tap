class V2ray < Formula
  desc "Platform for building proxies to bypass network restrictions"
  homepage "https://v2fly.org/"
  license all_of: ["MIT", "CC-BY-SA-4.0"]
  version "5.38.0"

  on_intel do
    url "https://github.com/v2fly/v2ray-core/releases/download/v#{version}/v2ray-macos-64.zip"
    sha256 "60e835e27ed3ee6a2ed62f462360ed6984390112e7c6a6d7966d156246919508"
  end

  on_arm do
    url "https://github.com/v2fly/v2ray-core/releases/download/v#{version}/v2ray-macos-arm64-v8a.zip"
    sha256 "6ad928e512b5fdae4cf0dd4f71c087a9010d35410f773aa3105c8211a8e58db8"
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
