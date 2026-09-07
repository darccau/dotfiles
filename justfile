# ─── Nix-managed dotfiles ────────────────────────────────────────────────────
# `just` is the task runner / documentation entry point.
# Run `just --list` to see every recipe.

set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

# switch to the built home-manager generation
switch:
    nix run .#homeConfigurations.forgemaster.activationPackage --print-build-logs

# build the configuration without activating
build:
    nix build .#homeConfigurations.forgemaster.activationPackage --print-build-logs

# dry-run: print what switch would do
dry-run:
    nix build .#homeConfigurations.forgemaster.activationPackage --dry-run

# evaluate the whole flake (catches config errors)
check:
    nix flake check

# update all flake inputs and commit the new lockfile
update:
    nix flake update

# format the repository (nixfmt + shfmt + prettier via treefmt)
fmt:
    nix fmt

# verify formatting without writing
fmt:check:
    nix fmt -- --check

# enter a devshell with just, age and agenix available
shell:
    nix develop

# edit an encrypted secret (usage: just secrets:edit git-email)
secrets:edit name:
    nix run .#agenix -- -e secrets/{{name}}.age -i .secrets/keys.txt

# re-encrypt every secret for the current identity
secrets:rekey:
    nix run .#agenix -- -r -i .secrets/keys.txt

# show a secret's plaintext (careful!)
secrets:show name:
    nix run .#agenix -- -d secrets/{{name}}.age -i .secrets/keys.txt
