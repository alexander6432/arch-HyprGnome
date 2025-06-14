#!/bin/bash
# Ruta a tu archivo .conf (corregida)
CONFIG_FILE="$HOME/.config/hypr/hyprborder.conf"

# Función para obtener el valor rgba de una variable
get_color() {
  local varname="$1"
  grep "^\$$varname[[:space:]]*=" "$CONFIG_FILE" | awk '{print $3}' | tr -d '[:space:]'
}

# Obtener colores
active_border="$(get_color primary_hue180)"

# Aplicar colores a Hyprland
hyprctl keyword general:border_size 3
hyprctl keyword general:col.active_border "$active_border"
hyprctl keyword decoration:shadow:enabled "true"
hyprctl keyword decoration:shadow:color "$active_border"
hyprctl keyword decoration:shadow:range 10
hyprctl keyword decoration:shadow:render_power 10
hyprctl keyword decoration:inactive_opacity 0.7
hyprctl keyword decoration:active_opacity 0.9

notify-send --app-name submaps "🪟 Submaps" "Entrando de Submapa Ventanas"
