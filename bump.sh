#!/usr/bin/env bash

set -euo pipefail

FORCE=false

error() { printf '%s\n' "$@" >&2; }

USAGE=$(
  cat <<-END
Usage: $0 [OPTION]... [FILE]
Bump a single formula/cask file; exit with 0 only when the file has been
updated.

Options:
  -f, --force         try to update even the version is already the latest;
                      useful when the developer re-released the same version
  -h, --help          display this help and exit

Home page: <https://github.com/qianbinbin/homebrew-tap>
END
)

while [ $# -ne 0 ]; do
  case "$1" in
  -f | --force) FORCE=true && shift ;;
  -h | --help) error "$USAGE" && exit ;;
  *) break ;;
  esac
done

if [ $# -ne 1 ] || [ ! -f "$1" ] || [[ "$1" != *.rb ]]; then
  error "$USAGE" && exit 2
fi

if sed --version 2>/dev/null | grep -qs GNU; then
  sed_i() { sed -i "$@"; }
else
  sed_i() { sed -i '' "$@"; }
fi

curl_gh() {
  curl -fsSL --retry 4 \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" "$@"
}

TMP_DIR=$(mktemp -d)
trap 'rm -fr "$TMP_DIR"' EXIT

update_gh_release() {
  _file="$1"
  pkg_name=$(basename "$_file" | sed 's/\.rb$//')
  error "==> Updating $pkg_name..."
  old_ver=$(sed -En 's/^ *version "([^"]+)"$/\1/p' "$_file")
  urls=$(sed -En 's|^ *url "([^"]+)"$|\1|p' "$_file")

  repo=$(echo "$urls" | head -1 | sed -En 's|https://github.com/([^/]+/[^/]+)/releases/download/.*|\1|p')
  curl_gh "https://api.github.com/repos/$repo/releases/latest" -o "$TMP_DIR/$pkg_name.json"
  new_tag=$(jq -r '.tag_name' "$TMP_DIR/$pkg_name.json")
  new_ver=${new_tag#v}
  new_ver=${new_ver#jq-} # fixup for jq

  ver_changed=false
  if [ "$old_ver" = "$new_ver" ]; then
    error "$pkg_name is already the latest version ($old_ver)."
    $FORCE || return 1
  else
    error "  $old_ver -> $new_ver"
    sed_i "s/version \"$old_ver\"$/version \"$new_ver\"/" "$_file"
    ver_changed=true
  fi

  sha256_changed=false
  for url in $urls; do
    old_sha256=$(grep -A 1 "$url" "$_file" | sed -En 's/^ *sha256 "([^"]+)"$/\1/p')
    [ -n "$old_sha256" ] || { error "sha256 not configured for $url" && continue; }
    new_name=$(basename "$url" | sed "s/#{version}/$new_ver/")
    new_sha256=$(
      jq -r ".assets[] | select(.name == \"$new_name\") | .digest" "$TMP_DIR/$pkg_name.json" |
        sed -En 's/^sha256:(.+)$/\1/p'
    )
    if [ -z "$new_sha256" ]; then
      new_url="${url//\#\{version\}/$new_ver}"
      error "sha256 not found on GitHub, downloading to compute..." "$new_url"
      curl -L --retry 4 "$new_url" -o "$TMP_DIR/$new_name"
      new_sha256=$(sha256sum "$TMP_DIR/$new_name" | awk '{ print $1 }')
    fi
    if [ "$old_sha256" = "$new_sha256" ]; then
      error "sha256 did't change for $url"
    else
      error "  $old_sha256 -> $new_sha256"
      sed_i "s/$old_sha256/$new_sha256/" "$_file"
      sha256_changed=true
    fi
  done
  $ver_changed || $sha256_changed || return 1
  error "Updated $_file."
}

url=$(sed -En 's|^ *url "(.+)"$|\1|p' "$1" | head -1)
case "$url" in
https://github.com/*/*/releases/download/*) update_gh_release "$1" ;;
*) error "Unsupported URL: $url" && exit 1 ;;
esac
