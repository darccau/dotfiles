#!/usr/bin/env bash

DAYS_INDEX=(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

TODAYS_INDEX=$(date +%w)

UPCOMING_DAYS=("${DAYS_INDEX[@]:TODAYS_INDEX}")

PIKED_DAY=$(printf "%s\n" "${UPCOMING_DAYS[@]}" | fzf --prompt="Pick a day: ")

[[ -z "$PIKED_DAY" ]] && exit 1

declare -A DAY_MAP=(
  [Sunday]=0
  [Monday]=1
  [Tuesday]=2
  [Wednesday]=3
  [Thursday]=4
  [Friday]=5
  [Saturday]=6
)

TARGET_INDEX=${DAY_MAP[$PIKED_DAY]}
offset=$(((7 + TARGET_INDEX - TODAYS_INDEX) % 7))
target_date=$(date -v+${offset}d +%y-%m-%d)

tmux new-window -n "agenda" nvim ~/Documents/notes/dailies/${target_date}.md
