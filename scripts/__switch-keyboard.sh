#!/usr/bin/env bash

TMUX_CONFIG_PATH=$(realpath $HOME/.tmux.conf)
PREFIX_SETTING=$(grep 'set-option -g prefix' $TMUX_CONFIG_PATH)
CURRENT_PREFIX=${PREFIX_SETTING##* }

function universal_replace {
  local pattern=$1
  local file=$2

  if [[ -z "$pattern" || -z "$file" ]]; then
    echo "$pattern: $file "
    echo "Usage: sed_replace 's/foo/bar/g' <file>"
    exit 1
  fi

  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "$pattern" "$file"
  else
    sed -i "$pattern" "$file"
  fi
}

if [[ -z $PREFIX_SETTING ]]; then
  echo "ERROR: The prefix was not defined into .tmux.conf"
  exit 1
fi

case $CURRENT_PREFIX in
'c-a')
  universal_replace 's/c-a/home/g' $TMUX_CONFIG_PATH
  ;;
'home')
  universal_replace 's/home/c-a/g' $TMUX_CONFIG_PATH
  ;;
*)
  echo 'ERROR: prefix pattern was not identified'
  exit 1
  ;;
esac

tmux source $TMUX_CONFIG_PATH
echo "Prefix toggled successfully."
