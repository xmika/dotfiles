#!/bin/bash
OUT="$(wmctrl -l | grep Slack | grep 'new item')"
echo $(echo $OUT | cut -d '|' -f 4)
#if [[ $(echo $OUT | awk '{print$6}') == "!" ]]; then
#  echo $(echo $OUT | cut -d ' ' -f 7-)
#else
#  echo ""
#fi
