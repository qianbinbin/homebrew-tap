# qianbinbin/homebrew-tap

Homebrew 直接安装官方二进制文件而无需编译，由 CI/CD 自动更新。

将此仓库添加到本地 Homebrew：

```sh
brew tap qianbinbin/tap
```

安装所需软件包，例如 rclone：

```sh
brew install qianbinbin/tap/rclone
```

如需删除此仓库：

```sh
brew untap qianbinbin/tap
```

## 已添加的包

通过以下命令查看仓库内所有包：

```sh
brew search qianbinbin/tap
```

<table>
  <tbody>
    <tr>
      <th>包</th>
      <th>类型</th>
      <th>最低系统</th>
      <th>版本</th>
    </tr>
    <tr>
      <td><a href="Formula/advcpmv.rb">advcpmv</a></td>
      <td>formula</td>
      <td></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fjarun%2Fadvcpmv%2Fcommits%3Fper_page%3D1&amp;search=%22sha%22%3A%22(.%7B7%7D)&amp;replace=HEAD-%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Formula/clean-mac-dumbs.rb">clean-mac-dumbs</a></td>
      <td>formula</td>
      <td></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fclean-mac-dumbs.rb&amp;search=version%20%22(.%2B)%22&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Formula/openlist.rb">openlist</a></td>
      <td>formula</td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fopenlist.rb&amp;search=depends_on%20macos%3A%20%3A(.%2B)&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fopenlist.rb&amp;search=version%20%22(.%2B)%22&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Formula/rclone.rb">rclone</a></td>
      <td>formula</td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Frclone.rb&amp;search=depends_on%20macos%3A%20%3A(.%2B)&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Frclone.rb&amp;search=version%20%22(.%2B)%22&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Formula/safe-rm.rb">safe-rm</a></td>
      <td>formula</td>
      <td></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fkaelzhang%2Fshell-safe-rm%2Fcommits%3Fper_page%3D1&amp;search=%22sha%22%3A%22(.%7B7%7D)&amp;replace=HEAD-%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Formula/tcping.rb">tcping</a></td>
      <td>formula</td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Ftcping.rb&amp;search=depends_on%20macos%3A%20%3A(.%2B)&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Ftcping.rb&amp;search=version%20%22(.%2B)%22&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Casks/orbstack@1.11.3.rb">orbstack@1.11.3</a></td>
      <td>cask</td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FCasks%2Forbstack%401.11.3.rb&amp;search=depends_on%20macos%3A%20%3A(.%2B)&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FCasks%2Forbstack@1.11.3.rb&amp;search=version%20%22(.%2B)%22&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Casks/vmware-fusion.rb">vmware-fusion</a></td>
      <td>cask</td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FCasks%2Fvmware-fusion.rb&amp;search=depends_on%20macos%3A%20%3A(.%2B)&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FCasks%2Fvmware-fusion.rb&amp;search=version%20%22(.%2B)%22&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
    <tr>
      <td><a href="Casks/vmware-fusion@13.6.rb">vmware-fusion@13.6</a></td>
      <td>cask</td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FCasks%2Fvmware-fusion%4013.6.rb&amp;search=depends_on%20macos%3A%20%3A(.%2B)&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
      <td><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FCasks%2Fvmware-fusion@13.6.rb&amp;search=version%20%22(.%2B)%22&amp;replace=%241&amp;label=" alt="Dynamic Regex Badge"></td>
    </tr>
  </tbody>
</table>

## 为什么添加此仓库

- ~~在被废弃的 macOS 上，Homebrew 已不提供 bottle（预编译的二进制文件），而他们不喜欢源码开发者官方提供的二进制文件。~~

  ~~如果从源码编译安装，不仅耗时，且可能存在不必要的依赖。另外，编译 Go 项目时 golang.org 在部分地区不可用，而 Homebrew
  不尊重环境变量设置的镜像。~~

  由于我已经不得不升级了 macOS，目前这部分包已经全部移除。未来如果我的系统再次被废弃，可能会添加回来。

- 一些软件的 Homebrew 官方包受到限制。

  例如，rclone 无法使用 mount 子命令。

- 一些软件没有 Homebrew 官方包。

  例如 openlist；tcping 则换为功能更强大的 Go 语言版本。

如果你有希望添加的包，请创建议题。
