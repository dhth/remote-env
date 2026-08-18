#!/usr/bin/env bash

set -euo pipefail

repo_root="$(
    cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &&
        pwd -P
)"

config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
install -d "$config_home"
cp -R "$repo_root/config/." "$config_home/"

install -d "$config_home/mise"
install -m 0644 \
    "$repo_root/tools/base/mise.toml" \
    "$config_home/mise/config.toml"
install -m 0644 \
    "$repo_root/tools/base/mise.lock" \
    "$config_home/mise/mise.lock"

"$HOME/.local/bin/mise" -C "$HOME" install --locked
