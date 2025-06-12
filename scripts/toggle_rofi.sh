#!/bin/bash

# Verifica si rofi está ejecutándose
if pgrep -x rofi >/dev/null; then
  # Si rofi está ejecutándose, ciérralo
  pkill -x rofi
else
  # Si no está ejecutándose, ábrelo
  rofi -show drun
fi
