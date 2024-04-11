#!/usr/bin/env bash

FILE_PATH=$(find $(dirname "${1}") -type f | sed 's#'"$HOME"'#~#g' | sed 's#'"\./"'##g' | \
  fzf --info inline-right --border sharp \
  --prompt="󰱼 File Search: " )

if [[ ! -z ${FILE_PATH} ]]; then
  nvim ${FILE_PATH}
fi
