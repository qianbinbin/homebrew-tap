cask "vmware-fusion" do
  version "26H1,25388279"
  sha256 "c1d373aa21be25674e3ecc518819e255785dea9d456d8747bcb0a2a59244bdf6"

  # Inspired by https://github.com/Homebrew/homebrew-cask/issues/206132#issuecomment-3705386380
  url "https://archive.org/download/vmwareworkstationarchive/Fusion/#{version.sub(/(u\d*)?,\d+/, '')}/VMware-Fusion-#{version.csv.first}-#{version.csv.second}_universal.dmg",
      verified: "archive.org/download/vmwareworkstationarchive/Fusion/"
  name "VMware Fusion"
  desc "Create, manage, and run virtual machines"
  homepage "https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion"

  auto_updates true
  conflicts_with cask: "qianbinbin/tap/vmware-fusion@13.6"
  depends_on macos: :sequoia

  app "VMware Fusion.app"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-bridge"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-cfgcli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-cli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-dhcpd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-natd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-netifup"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-sniffer"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmcli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmrest"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmrun"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmss2core"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/VMware OVF Tool/ovftool"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-aewp"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-cloneBootCamp"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-id"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-ntfs"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-rawdiskAuthTool"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-rawdiskCreator"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-remotemks"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-usbarbitrator"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vdiskmanager"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmdkserver"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx-debug"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx-stats"

  postflight do
    system_command "#{appdir}/VMware Fusion.app/Contents/Library/Initialize VMware Fusion.tool",
                   args:         ["set"],
                   sudo:         true,
                   sudo_as_root: true
  end

  uninstall_preflight do
    set_ownership "#{appdir}/VMware Fusion.app"
  end

  uninstall delete: "/etc/paths.d/com.vmware.fusion.public"

  zap trash: [
    "/Library/Application Support/VMware",
    "/Library/Logs/VMware Fusion Services.log",
    "/Library/Logs/VMware USB Arbitrator Service.log",
    "/Library/Logs/VMware",
    "/Library/Preferences/VMware Fusion",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.vmware.fusion.sfl*",
    "~/Library/Application Support/VMware Fusion Applications Menu",
    "~/Library/Application Support/VMware Fusion",
    "~/Library/Caches/com.vmware.fusion",
    "~/Library/Logs/VMware Fusion Applications Menu",
    "~/Library/Logs/VMware Fusion",
    "~/Library/Logs/VMware Graphics Service.log",
    "~/Library/Logs/VMware",
    "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist",
    "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusion.plist",
    "~/Library/Preferences/com.vmware.fusion.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusionApplicationsMenu.helper.plist",
    "~/Library/Preferences/com.vmware.fusionApplicationsMenu.plist",
    "~/Library/Preferences/com.vmware.fusionDaemon.plist",
    "~/Library/Preferences/com.vmware.fusionDaemon.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusionStartMenu.plist",
    "~/Library/Preferences/com.vmware.fusionStartMenu.plist.lockfile",
    "~/Library/Preferences/VMware Fusion",
    "~/Library/Saved Application State/com.vmware.fusion.savedState",
    "~/Library/WebKit/com.vmware.fusion",
  ]

  caveats <<~EOS
    I (the maintainer of this tap) have downgraded my system to Ventura, and this cask will no longer be updated.

    To install VMware Fusion 13.6 (at least Ventura is required), run:
      brew install --cask qianbinbin/tap/vmware-fusion@13.6

    Use it at your own risk.
  EOS
end
