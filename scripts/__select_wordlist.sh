#!/usr/bin/env bash

# Select a wordlist using fzf
wordlist=$(find ~/Public/SecLists/ -type f ! -path '*/.git/*' |
  fzf --delimiter / --with-nth -1)

[ -z "$wordlist" ] && exit 0

tmux set-environment -g wordlist "$wordlist"

tmux send-keys "export wordlist=\"$wordlist\"" C-m
