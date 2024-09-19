#!/usr/bin/env bash
 
echo AEROSPACE_PREV_WORKSPACE: $AEROSPACE_PREV_WORKSPACE, \
 AEROSPACE_FOCUSED_WORKSPACE: $AEROSPACE_FOCUSED_WORKSPACE \
 SELECTED: $SELECTED \
 BG2: $BG2 \
 INFO: $INFO \
 SENDER: $SENDER \
 NAME: $NAME \
  >> ~/aaaa

source "$CONFIG_DIR/colors.sh"

AEROSPACE_FOCUSED_MONITOR=$(aerospace list-monitors --focused | awk '{print $1}')
AEROSAPCE_WORKSPACE_FOCUSED_MONITOR=$(aerospace list-workspaces --monitor 1 --empty no)
AEROSPACE_EMPTY_WORKESPACE=$(aerospace list-workspaces --monitor 1 --empty)

reload_workspace_icon() {
  # echo reload_workspace_icon "$@" >> ~/aaaa
  apps=$(aerospace list-windows --workspace "$@" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --animate sin 10 --set space.$@ label="$icon_strip"
}

multi_monitor=false
# Check if there are more than one monitor
if [ ${#monitors[@]} -gt 1 ]; then
 multi_monitor=true
fi

if [ "$SENDER" = "aerospace_workspace_change" ]; then

  # if [ $i = "$FOCUSED_WORKSPACE" ]; then
  #   sketchybar --set space.$FOCUSED_WORKSPACE background.drawing=on
  # else
  #   sketchybar --set space.$FOCUSED_WORKSPACE background.drawing=off
  # fi
  #echo 'space_windows_change: '$AEROSPACE_FOCUSED_WORKSPACE >> ~/aaaa
  #echo space: $space >> ~/aaaa
  #space="$(echo "$INFO" | jq -r '.space')"
  #apps="$(echo "$INFO" | jq -r '.apps | keys[]')"
  # apps=$(aerospace list-windows --workspace $AEROSPACE_FOCUSED_WORKSPACE | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
  #
  # icon_strip=" "
  # if [ "${apps}" != "" ]; then
  #   while read -r app
  #   do
  #     icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
  #   done <<< "${apps}"
  # else
  #   icon_strip=" —"
  # fi

  reload_workspace_icon "$AEROSPACE_PREV_WORKSPACE"
  reload_workspace_icon "$AEROSPACE_FOCUSED_WORKSPACE"

  echo "AEROSPACE_FOCUSED_WORKSPACE: $AEROSPACE_FOCUSED_WORKSPACE, AEROSPACE_PREV_WORKSPACE: $AEROSPACE_PREV_WORKSPACE" 

  #sketchybar --animate sin 10 --set space.$space label="$icon_strip"

  # current workspace space border color
  sketchybar --set space.$AEROSPACE_FOCUSED_WORKSPACE icon.highlight=true \
                         label.highlight=true \
                         background.border_color=$GREY

  # prev workspace space border color
  sketchybar --set space.$AEROSPACE_PREV_WORKSPACE icon.highlight=false \
                         label.highlight=false \
                         background.border_color=$BACKGROUND_2

   
  # if [ "$AEROSPACE_FOCUSED_WORKSPACE" -gt 3 ]; then
  #   sketchybar --animate sin 10 --set space.$AEROSPACE_FOCUSED_WORKSPACE display=1
  # fi
  ## focused 된 모니터에 space 상태 보이게 설정
  for i in $AEROSAPCE_WORKSPACE_FOCUSED_MONITOR; do
    # if index if 10 or more, display on monitor 2
    if [ "$i" -gt 9 ]; then
      sketchybar --set space.$i display=2
    elif [ "$i" -lt 10 ]; then
      sketchybar --set space.$i display=1
    fi
  done

  for i in $AEROSPACE_EMPTY_WORKESPACE; do
    sketchybar --set space.$i display=0
  done

  sketchybar --set space.$AEROSPACE_FOCUSED_WORKSPACE display=1

fi
