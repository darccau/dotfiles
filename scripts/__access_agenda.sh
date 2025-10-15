#!/usr/bin/env bash

DAYS_INDEX=(Monday Tuesday Wednesday Thursday Friday Saturday)
TODAYS_INDEX=$(date +%w)

# Sunday comes first, renamed to "Weekly Planning"
OPTIONS=("Weekly Planning" "${DAYS_INDEX[@]}")

# Add "Monthly Planning" at the end
OPTIONS+=("Monthly Planning")

# Prompt user to pick
SELECTED=$(printf "%s\n" "${OPTIONS[@]}" | fzf --prompt="Pick a day: ")

[[ -z "$SELECTED" ]] && exit 1

# Map labels to their corresponding day index
declare -A LABEL_MAP=(
  ["Weekly Planning"]=0
  [Monday]=1
  [Tuesday]=2
  [Wednesday]=3
  [Thursday]=4
  [Friday]=5
  [Saturday]=6
)

if [[ "$SELECTED" == "Monthly Planning" ]]; then
  # Calculate last Sunday of the current month
  last_day=$(date -v+1m -v-1d +%Y-%m-%d)
  last_sunday=$(date -j -f "%Y-%m-%d" "$last_day" -v-sun +%Y-%m-%d)
  target_date="$last_sunday"
else
  TARGET_INDEX=${LABEL_MAP[$SELECTED]}
  offset=$(((7 + TARGET_INDEX - TODAYS_INDEX) % 7))
  target_date=$(date -v+${offset}d +%Y-%m-%d)
fi

tmux new-window -n "agenda" nvim ~/Documents/notes/dailies/${target_date}.md
