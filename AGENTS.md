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

## Native mise bootstrap contract

- This repository is consumed directly with `mise bootstrap --adopt`.
- Caller repositories install mise and invoke the bootstrap as optional,
  non-fatal personal setup.
- `config.toml` contains the global user tool set and bootstrap configuration.
- Keep tool requests and the generated global `mise.lock` in sync. Regenerate
  it from this checkout with `MISE_CONFIG_DIR="$PWD" mise lock --global`.

## Repository layout

- `config.toml` and `mise.lock` define the global user tools.
- `config/` mirrors `~/.config` and is applied as a Git-manifest-backed
  directory copy.
- Tool-specific user configuration belongs under `config/<tool>/`.

Do not add caches, generated state, credentials, tokens, or other secrets under
`config/`. This repository is public.
