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

| 包                                  | 类型    | 编译时依赖                  | 版本                                                                                                                                                                                                                                              |
| ----------------------------------- | ------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bat](Formula/bat.rb)               | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fbat.rb&search=version%20%22(.%2B)%22&replace=%241&label=bat>)               |
| [fd](Formula/fd.rb)                 | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Ffd.rb&search=version%20%22(.%2B)%22&replace=%241&label=fd>)                 |
| [fzf](Formula/fzf.rb)               | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Ffzf.rb&search=version%20%22(.%2B)%22&replace=%241&label=fzf>)               |
| [gh](Formula/gh.rb)                 | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fgh.rb&search=version%20%22(.%2B)%22&replace=%241&label=gh>)                 |
| [hugo](Formula/hugo.rb)             | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fhugo.rb&search=version%20%22(.%2B)%22&replace=%241&label=hugo>)             |
| [jq](Formula/jq.rb)                 | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fjq.rb&search=version%20%22(.%2B)%22&replace=%241&label=jq>)                 |
| [openlist](Formula/openlist.rb)     | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fopenlist.rb&search=version%20%22(.%2B)%22&replace=%241&label=openlist>)     |
| [pandoc](Formula/pandoc.rb)         | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fpandoc.rb&search=version%20%22(.%2B)%22&replace=%241&label=pandoc>)         |
| [rclone](Formula/rclone.rb)         | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Frclone.rb&search=version%20%22(.%2B)%22&replace=%241&label=rclone>)         |
| [ripgrep](Formula/ripgrep.rb)       | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fripgrep.rb&search=version%20%22(.%2B)%22&replace=%241&label=ripgrep>)       |
| [shellcheck](Formula/shellcheck.rb) | formula | [pandoc](Formula/pandoc.rb) | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fshellcheck.rb&search=version%20%22(.%2B)%22&replace=%241&label=shellcheck>) |
| [shfmt](Formula/shfmt.rb)           | formula | scdoc                       | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fshfmt.rb&search=version%20%22(.%2B)%22&replace=%241&label=shfmt>)           |
| [syncthing](Formula/syncthing.rb)   | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fsyncthing.rb&search=version%20%22(.%2B)%22&replace=%241&label=syncthing>)   |
| [tcping](Formula/tcping.rb)         | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Ftcping.rb&search=version%20%22(.%2B)%22&replace=%241&label=tcping>)         |
| [tlrc](Formula/tlrc.rb)             | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Ftlrc.rb&search=version%20%22(.%2B)%22&replace=%241&label=tlrc>)             |
| [v2ray](Formula/v2ray.rb)           | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fv2ray.rb&search=version%20%22(.%2B)%22&replace=%241&label=v2ray>)           |
| [yamlfmt](Formula/yamlfmt.rb)       | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fyamlfmt.rb&search=version%20%22(.%2B)%22&replace=%241&label=yamlfmt>)       |
| [yazi](Formula/yazi.rb)             | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fyazi.rb&search=version%20%22(.%2B)%22&replace=%241&label=yazi>)             |
| [yq](Formula/yq.rb)                 | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fyq.rb&search=version%20%22(.%2B)%22&replace=%241&label=yq>)                 |
| [zellij](Formula/zellij.rb)         | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fzellij.rb&search=version%20%22(.%2B)%22&replace=%241&label=zellij>)         |
| [zoxide](Formula/zoxide.rb)         | formula |                             | ![Dynamic Regex Badge](<https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fgithub.com%2Fqianbinbin%2Fhomebrew-tap%2Fraw%2Frefs%2Fheads%2Fmaster%2FFormula%2Fzoxide.rb&search=version%20%22(.%2B)%22&replace=%241&label=zoxide>)         |

## 为什么添加此仓库

- 在被废弃的 macOS 上，Homebrew 已不提供 bottle（预编译的二进制文件），而他们不喜欢源码开发者官方提供的二进制文件。
- 源码编译安装耗时很长，且可能存在不必要的依赖。
- Homebrew 官方的安装方式受到限制（例如，rclone 无法使用 mount 子命令）。
- golang.org 在部分地区不可用。
- 一些软件没有官方 formula/cask 或 tap 仓库（例如，openlist）。

如果你有希望添加的包，请创建议题。
