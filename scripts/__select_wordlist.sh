#!/usr/bin/env bash

find ~/Documents/SecLists/ -type f ! -path '*/.git/*' | fzf --delimiter / --with-nth -1 | pbcopy
