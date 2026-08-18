# remote-env

This repository provisions personal tools and configuration for ephemeral
remote development environments.

## Scope

Project repositories own the tools, configuration, and instructions required to
work on that specific project.

This repository contains user-scoped tools and preferences that are broadly
useful across remote development environments. Do not move project-specific
requirements here merely to share setup code. Configuration that applies to only
one project belongs in that project's repository.

## Public setup contract

- `setup.sh` is the stable entry point used by caller repositories.
- Caller repositories install mise before invoking `setup.sh`.
- `setup.sh` must resolve files relative to its own location. Do not assume the
  caller's working directory is this repository.
- Keep `setup.sh` safe to run repeatedly.
- Let `setup.sh` return failures normally. Callers decide whether personal setup
  failures should be non-fatal.

Callers know only that the configured user-environment repository contains an
executable `setup.sh` at its root. Internal paths such as `config/` and
`tools/base/` are not part of the public contract.

## Repository layout

- `config/` mirrors `$XDG_CONFIG_HOME` and is copied into
  `${XDG_CONFIG_HOME:-$HOME/.config}`.
- `tools/base/` contains mise tools installed in every configured environment.
- Tool-specific user configuration belongs under `config/<tool>/`.

Do not add caches, generated state, credentials, tokens, or other secrets under
`config/`. This repository is public.
