# qianbinbin/homebrew-tap

Homebrew 直接安装官方二进制文件而无需编译。

## 已添加的 formula/cask

[![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fhugo.rb&search=version%20%22(.%2B)%22&replace=%241&label=hugo>)](Formula/hugo.rb)
[![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Frclone.rb&search=version%20%22(.%2B)%22&replace=%241&label=rclone>)](Formula/rclone.rb)
[![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fshfmt.rb&search=version%20%22(.%2B)%22&replace=%241&label=shfmt>)](Formula/shfmt.rb)
[![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fsyncthing.rb&search=version%20%22(.%2B)%22&replace=%241&label=syncthing>)](Formula/syncthing.rb)

## 如何安装这些 formula/cask

将此仓库添加到本地 Homebrew：

```sh
brew tap qianbinbin/tap
```

例如，安装 rclone：

```sh
brew install qianbinbin/tap/rclone
```

要删除此仓库：

```sh
brew untap qianbinbin/tap
```

## 为什么添加此仓库

- 在被废弃的 macOS 上，Homebrew 已不提供 bottle（预编译的二进制文件），而他们不喜欢源码开发者官方提供的二进制文件。
- 源码编译安装耗时很长，且可能存在不必要的依赖。
- Homebrew 官方的安装方式受到限制（例如，rclone 无法使用 mount 子命令）。
- golang.org 在部分地区不可用。
