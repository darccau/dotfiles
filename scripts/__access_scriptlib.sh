!#/usr/bin/env bash

find ~/Documents/projects/dotfiles/scripts/ | fzf --delimiter /with-nth -1 | xargs nvim
