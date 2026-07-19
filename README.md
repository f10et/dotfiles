# f10et dotfiles

Personal dotfiles, organized as composable modules.

Each top-level topic directory can provide shell config, symlinks, or an
installer:

- `*.zsh` files are sourced by zsh when the module is enabled.
- `path.zsh` and `_path.zsh` are sourced before other shell files.
- `completion.zsh` is sourced after `compinit`.
- `*.symlink` files are linked into `$HOME` without the `.symlink` suffix.
- `install.sh` runs when installing that module.

Enabled modules live in:

```sh
~/.config/dotfiles/enabled
```

If that file does not exist, the `default` profile is used.

## Commands

```sh
dot list
dot enabled
dot profile minimal
dot enable go node
dot disable docker
dot bootstrap
dot install
dot apply profile dev
```

`dot apply` saves the requested module set, links dotfiles, and runs installers.

## Profiles

Profiles are plain text files in `profiles/`, one module per line.

- `minimal`: shell and git basics.
- `dev`: common development tools.
- `mac`: development tools plus macOS-specific config.
- `default`: current broad setup.

Example:

```sh
dot apply profile minimal
dot apply profile dev
dot apply zsh git go
```

## Bootstrap

Run this on a new machine:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/f10et/dotfiles/master/bootstrap.sh)"
```

Or pick a smaller profile from the start:

```sh
DOTFILES_PROFILE=minimal /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/f10et/dotfiles/master/bootstrap.sh)"
```

## Layout

- `bin/`: scripts added to `$PATH` by the `system` module.
- `system/`: base path, environment, functions, keys, and shell defaults.
- `zsh/`: zsh entrypoint, aliases, prompt, and shell behavior.
- `git/`, `go/`, `node/`, `ruby/`, `docker/`: tool-specific modules.
- `macos/`, `xcode/`: Apple platform config.
- `profiles/`: named module sets.
