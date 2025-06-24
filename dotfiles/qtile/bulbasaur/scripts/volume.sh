#!/usr/bin/env bash

msgTag="mybrightness"

brackets_regex="\((.*?)\%\)"

case $1 in
  "up")
    res=`amixer set Master 5%+`
    if [[ $res =~ $brackets_regex ]]; then
      brightness=${BASH_REMATCH[1]}
      dunstify -a brightnessUp -i brightness-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$brightness" "Brightness: ${brightness}%"
    fi
  ;;
  "down")
    res=`amixer set Master 5%+`
    if [[ $res =~ $brackets_regex ]]; then
      brightness=${BASH_REMATCH[1]}
      dunstify -a brightnessUp -i brightness-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$brightness" "Brightness: ${brightness}%"
    fi
  ;;
esac
