# dotfiles

Nix-managed personal dotfiles for daily use and cyber security work.

Everything in this repository is **declared in Nix** and deployed with
[home-manager] through [flake-parts]. There are no dotfiles hidden inside
`$HOME` or `~/.config` — they are all generated from this flake.

## Layout

```
.
├── flake.nix                 # inputs + flake-parts wiring
├── flake.lock                # pinned, reproducible inputs (committed)
├── justfile                  # task runner: the documentation entry point
├── flake-modules/
│   ├── home-manager.nix      # builds a homeConfiguration per host/ directory
│   └── treefmt.nix           # repository-wide formatter (nixfmt, shfmt, prettier)
├── hosts/
│   └── forgemaster/
│       └── home.nix          # host entrypoint: user, home, stateVersion
├── home/
│   ├── options.nix           # dotfiles.* options (paths, dirs)
│   ├── global.nix            # packages, session vars, xdg
│   ├── scripts.nix           # turns scripts/ into packages on PATH
│   ├── scripts/              # source of the shell scripts (@VAR@ placeholders)
│   ├── secrets.nix           # age-encrypted secrets wired into home-manager
│   └── programs/
│       ├── git.nix           # git identity, aliases, delta
│       ├── tmux.nix          # tmux config, tokyonight theme, TPM plugins
│       ├── nvim.nix          # nixvim: Neovim fully declared in Nix
│       ├── ghostty.nix       # ghostty terminal
│       ├── radare2.nix       # radare2 rc
│       ├── zathura.nix       # zathura rc
│       └── hunk.nix          # hunk config
└── secrets/                  # agenix-encrypted secrets (age files are tracked)
    ├── secrets.nix           # rekey manifest (allowed public keys)
    └── *.age                 # encrypted blobs
```

## Prerequisites

- Nix ≥ 2.24 with `nix-command` and `flakes` enabled:

  ```sh
  echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
  ```

- `just` (task runner) — or use the recipes from the flake devshell.

## Quickstart

```sh
just build     # build the configuration (no side effects)
just switch    # activate the new home-manager generation
```

`just --list` shows every recipe:

| recipe           | what it does                                  |
| ---------------- | --------------------------------------------- |
| `just build`     | build the `forgemaster` homeConfiguration     |
| `just switch`    | build **and activate** the new generation     |
| `just dry-run`   | preview what switch would build               |
| `just check`     | evaluate the whole flake (config correctness) |
| `just update`    | update all inputs and lockfile                |
| `just fmt`       | format the repo (treefmt)                     |
| `just shell`     | enter the devshell                            |
| `just secrets:*` | manage age-encrypted secrets (see below)      |

## Scripts

The interactive helpers (agenda, sessionizer, snippets, wordlist picker, …)
are packaged with `writeShellApplication` and installed to `$PATH`, so tmux
bindings call them by their store path:

| binding | action                   |
| ------- | ------------------------ |
| `C-a w` | pick a SecLists wordlist |
| `C-a /` | paste a pentest snippet  |
| `C-a a` | agenda / notes           |
| `C-a m` | sessionizer              |
| `C-a d` | select a note            |
| `C-a g` | lazygit in current dir   |

User-specific paths (notes, SecLists, repo location) are configurable via
`dotfiles.*` options in `home/options.nix`.

## Secrets

Secrets are **age-encrypted** (agenix-style) and committed as `*.age` files —
safe to push. The private key lives at `.secrets/keys.txt` and is gitignored.

```sh
just secrets:edit git-email      # edit a secret with $EDITOR
just secrets:rekey               # re-encrypt all secrets for this identity
just secrets:show git-email      # print plaintext (careful)
```

Decrypting into `$HOME` happens automatically during `just switch` through the
home-manager `age` module. To add a new secret:

1. `just secrets:edit my-new-secret`
2. declare it in `home/secrets.nix`
3. reference it from a module (e.g. `builtins.readFile config.age.secrets.my-new-secret.path` where appropriate, or via an activation step)

> Note: git identity (name/email/signing key) is public metadata and therefore
> kept inline in `home/programs/git.nix`, not encrypted.

## Why Nix?

- **Reproducible**: the whole environment is pinned in `flake.lock`.
- **Atomic**: `just switch` swaps the entire home in one transaction.
- **Declarative**: no stray dotfiles — configs live in this repo, in Nix.
- **Portable**: adding a host is just a new `hosts/<name>/home.nix`.

[home-manager]: https://github.com/nix-community/home-manager
[flake-parts]: https://flake.parts
