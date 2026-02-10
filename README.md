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

| 包                              | 类型    | 编译时依赖 | 版本                                                                                                                                                                                                                                          |
| ------------------------------- | ------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [openlist](Formula/openlist.rb) | formula |            | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fopenlist.rb&search=version%20%22(.%2B)%22&replace=%241&label=openlist>) |
| [rclone](Formula/rclone.rb)     | formula |            | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Frclone.rb&search=version%20%22(.%2B)%22&replace=%241&label=rclone>)     |
| [safe-rm](Formula/safe-rm.rb)   | formula |            | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fkaelzhang%2Fshell-safe-rm%2Fcommits%3Fper_page%3D1&search=%22sha%22%3A%22(.%7B7%7D)&replace=HEAD-%241&label=safe-rm>)           |
| [tcping](Formula/tcping.rb)     | formula |            | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Ftcping.rb&search=version%20%22(.%2B)%22&replace=%241&label=tcping>)     |

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
