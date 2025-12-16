#!/usr/bin/env bash

set -euo pipefail

# Configuration
AGENDA_PATH="${HOME}/Documents/notes" # Change this to your preferred storage location

# Color definitions
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Utility functions
error() {
  echo -e "${RED}Error: $*${NC}" >&2
  exit 1
}

info() {
  echo -e "${BLUE}$*${NC}"
}

warning() {
  echo -e "${YELLOW}$*${NC}"
}

success() {
  echo -e "${GREEN}$*${NC}"
}

# Dependency check
check_dependencies() {
  local missing_deps=()

  command -v fzf >/dev/null 2>&1 || missing_deps+=("fzf")
  command -v nvim >/dev/null 2>&1 || missing_deps+=("nvim")

  if [[ ${#missing_deps[@]} -gt 0 ]]; then
    error "Missing dependencies: ${missing_deps[*]}"
  fi
}

# Date utilities
get_current_year() {
  date +%Y
}

get_current_month() {
  date +%m
}

get_current_month_name() {
  date +%B | tr '[:upper:]' '[:lower:]'
}

get_current_week() {
  date +%U
}

get_current_date() {
  date +%Y-%m-%d
}

get_current_day_name() {
  date +%A
}

is_sunday() {
  [[ $(date +%u) -eq 7 ]]
}

is_first_week_of_year() {
  local week_num=$(get_current_week)
  [[ $week_num -eq 0 || $week_num -eq 1 ]]
}

is_first_sunday_of_month() {
  if ! is_sunday; then
    return 1
  fi

  local day=$(date +%d)
  [[ $day -le 7 ]]
}

# Path builders
get_year_path() {
  local year=${1:-$(get_current_year)}
  echo "${AGENDA_PATH}/${year}"
}

get_month_path() {
  local year=${1:-$(get_current_year)}
  local month=${2:-$(get_current_month)}
  local month_name=$(date -d "${year}-${month}-01" +%B 2>/dev/null || date -j -f "%Y-%m-%d" "${year}-${month}-01" +%B 2>/dev/null | tr '[:upper:]' '[:lower:]')
  echo "$(get_year_path "$year")/${month}-${month_name}"
}

get_week_path() {
  local year=${1:-$(get_current_year)}
  local week=${2:-$(get_current_week)}
  local month=$(date +%m)
  echo "$(get_month_path "$year" "$month")/week-$(printf "%02d" "$week")"
}

get_day_path() {
  local date=${1:-$(get_current_date)}
  local year=$(echo "$date" | cut -d'-' -f1)
  local week=$(date -d "$date" +%U 2>/dev/null || date -j -f "%Y-%m-%d" "$date" +%U 2>/dev/null)
  echo "$(get_week_path "$year" "$week")/${date}.md"
}

# File getters
get_year_file() {
  local year=${1:-$(get_current_year)}
  echo "$(get_year_path "$year")/year.md"
}

get_month_file() {
  local year=${1:-$(get_current_year)}
  local month=${2:-$(get_current_month)}
  echo "$(get_month_path "$year" "$month")/month.md"
}

get_week_file() {
  local year=${1:-$(get_current_year)}
  local week=${2:-$(get_current_week)}
  echo "$(get_week_path "$year" "$week")/week.md"
}

# Context retrieval
get_year_goal() {
  local year_file=$(get_year_file)
  if [[ -f "$year_file" ]]; then
    grep -v "^#" "$year_file" | grep -v "^<!--" | grep -v "^$" | head -n 1
  else
    echo "Not set"
  fi
}

get_month_goal() {
  local month_file=$(get_month_file)
  if [[ -f "$month_file" ]]; then
    grep -v "^#" "$month_file" | grep -v "^<!--" | grep -v "^$" | head -n 1
  else
    echo "Not set"
  fi
}

get_week_goal() {
  local week_file=$(get_week_file)
  if [[ -f "$week_file" ]]; then
    grep -v "^#" "$week_file" | grep -v "^<!--" | grep -v "^$" | head -n 1
  else
    echo "Not set"
  fi
}

# Rollover functionality
get_uncompleted_items() {
  local file=$1

  if [[ ! -f "$file" ]]; then
    return
  fi

  # Extract unchecked checkboxes and their content
  grep "^- \[ \]" "$file" || true
}

create_rollover_section() {
  local previous_file=$1
  local period_name=$2

  local uncompleted=$(get_uncompleted_items "$previous_file")

  if [[ -n "$uncompleted" ]]; then
    echo ""
    echo "## Carried over from $period_name"
    echo ""
    echo "$uncompleted"
    echo ""
  fi
}

# Template creators
create_year_template() {
  local year=$1
  cat <<EOF
# Year Goals - $year

<!-- Define your main objectives for the year -->

## Primary Objective


## Key Areas of Focus

- [ ] 
- [ ] 
- [ ] 

EOF
}

create_month_template() {
  local year=$1
  local month=$2
  local month_name=$(date -d "${year}-${month}-01" +%B 2>/dev/null || date -j -f "%Y-%m-%d" "${year}-${month}-01" +%B 2>/dev/null)
  local previous_month=$(date -d "${year}-${month}-01 -1 month" +%Y-%m 2>/dev/null || date -j -v-1m -f "%Y-%m-%d" "${year}-${month}-01" +%Y-%m 2>/dev/null)
  local prev_year=$(echo "$previous_month" | cut -d'-' -f1)
  local prev_mon=$(echo "$previous_month" | cut -d'-' -f2)
  local previous_file=$(get_month_file "$prev_year" "$prev_mon")

  cat <<EOF
# Month Goals - $month_name $year

<!-- Define your goals for this month -->

## Main Goal


## Tasks

- [ ] 
- [ ] 

EOF

  create_rollover_section "$previous_file" "$month_name"
}

create_week_template() {
  local year=$1
  local week=$2
  local previous_week=$((week - 1))
  local previous_file=$(get_week_file "$year" "$previous_week")

  cat <<EOF
# Week Goals - Week $week, $year

<!-- Define your goals for this week -->

## Focus


## Objectives

- [ ] 
- [ ] 

EOF

  create_rollover_section "$previous_file" "Week $previous_week"
}

create_day_template() {
  local date=$1
  local day_name=$(date -d "$date" +%A 2>/dev/null || date -j -f "%Y-%m-%d" "$date" +%A 2>/dev/null)
  local formatted_date=$(date -d "$date" "+%B %d, %Y" 2>/dev/null || date -j -f "%Y-%m-%d" "$date" "+%B %d, %Y" 2>/dev/null)

  local year_goal=$(get_year_goal)
  local month_goal=$(get_month_goal)
  local week_goal=$(get_week_goal)

  cat <<EOF
<!-- CONTEXT (read-only) -->
🎯 Year: $year_goal
📅 Month: $month_goal
📝 Week: $week_goal
---

# $day_name, $formatted_date

## Tasks

- [ ] 

## Notes

EOF
}

# File creators
create_note() {
  local type=$1
  local file=$2

  mkdir -p "$(dirname "$file")"

  case $type in
  year)
    local year=$(get_current_year)
    create_year_template "$year" >"$file"
    ;;
  month)
    if ! is_first_sunday_of_month; then
      warning "It's not the first Sunday of the month."
      read -p "Create month goals anyway? (y/N): " -n 1 -r
      echo
      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return 1
      fi
    fi
    local year=$(get_current_year)
    local month=$(get_current_month)
    create_month_template "$year" "$month" >"$file"
    ;;
  week)
    if ! is_sunday; then
      warning "It's not Sunday."
      read -p "Create week goals anyway? (y/N): " -n 1 -r
      echo
      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return 1
      fi
    fi
    local year=$(get_current_year)
    local week=$(get_current_week)
    create_week_template "$year" "$week" >"$file"
    ;;
  day)
    local date=$(get_current_date)
    create_day_template "$date" >"$file"
    ;;
  esac
}

# Main menu
show_menu() {
  local current_date=$(get_current_date)
  local current_day=$(get_current_day_name)
  local current_week=$(get_current_week)
  local current_month=$(get_current_month_name)
  local current_year=$(get_current_year)

  local options=(
    "Today ($current_day, $current_date)"
    "This Week (Week $current_week)"
    "This Month ($current_month)"
    "This Year ($current_year)"
  )

  local selection=$(printf '%s\n' "${options[@]}" | fzf \
    --prompt="Select period: " \
    --height=40% \
    --layout=reverse \
    --border \
    --preview-window=hidden \
    --bind 'j:down,k:up,l:accept,h:cancel' \
    --header="Navigate: j/k or arrows | Select: l or Enter | Cancel: h or Esc")

  echo "$selection"
}

# Main logic
open_note() {
  local selection=$1
  local file=""
  local type=""

  case $selection in
  Today*)
    file=$(get_day_path)
    type="day"
    ;;
  "This Week"*)
    file=$(get_week_file)
    type="week"
    ;;
  "This Month"*)
    file=$(get_month_file)
    type="month"
    ;;
  "This Year"*)
    file=$(get_year_file)
    type="year"
    ;;
  *)
    error "Invalid selection"
    ;;
  esac

  # Create note if it doesn't exist
  if [[ ! -f "$file" ]]; then
    info "Creating new $type note..."
    if ! create_note "$type" "$file"; then
      exit 0
    fi
    success "Created: $file"
  fi

  # Open in nvim
  nvim "$file"
}

# Main execution
main() {
  check_dependencies

  local selection=$(show_menu)

  if [[ -z "$selection" ]]; then
    info "Cancelled"
    exit 0
  fi

  open_note "$selection"
}

main "$@"
