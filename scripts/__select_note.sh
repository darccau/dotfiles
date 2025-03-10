#!/usr/bin/env bash

find ~/Documents/notes/ -type f -name "*.md" ! -path '*/.git/*' | fzf --delimiter / --with-nth -1 | xargs nvim
