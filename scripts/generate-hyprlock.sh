#!/bin/bash
# ~/.local/bin/generate-hyprlock-config.sh

# Función para convertir hex a rgba
hex_to_rgba() {
  local hex=$1
  local alpha=${2:-1.0} # Alpha por defecto es 1.0 si no se especifica
  # Remover el # si existe
  hex=${hex#\#}
  # Convertir a decimal
  local r=$((16#${hex:0:2}))
  local g=$((16#${hex:2:2}))
  local b=$((16#${hex:4:2}))
  echo "rgba($r, $g, $b, $alpha)"
}

# Leer colores de pywal
source ~/.cache/wal/colors.sh
# Obtener wallpaper
WALLPAPER=$(cat ~/.cache/wal/wal)

# Convertir colores con diferentes valores de alpha
FOREGROUND=$(hex_to_rgba "$foreground" 1.0)
FOREGROUND_SOLID=$(hex_to_rgba "$foreground" 0.80)
FOREGROUND_TRANS=$(hex_to_rgba "$foreground" 0.20)
COLOR1=$(hex_to_rgba "$color1" 1.0)
COLOR1_SOLID=$(hex_to_rgba "$color1" 0.80)
COLOR1_TRANS=$(hex_to_rgba "$color1" 0.20)
COLOR2=$(hex_to_rgba "$color2" 1.0)
COLOR2_SOLID=$(hex_to_rgba "$color2" 0.80)
COLOR2_TRANS=$(hex_to_rgba "$color2" 0.35)
COLOR3=$(hex_to_rgba "$color3" 1.0)
COLOR3_SOLID=$(hex_to_rgba "$color3" 0.80)
COLOR3_TRANS=$(hex_to_rgba "$color3" 0.35)
COLOR4=$(hex_to_rgba "$color4" 1.0)
COLOR4_SOLID=$(hex_to_rgba "$color4" 0.80)
COLOR4_TRANS=$(hex_to_rgba "$color4" 0.35)
COLOR5=$(hex_to_rgba "$color5" 1.0)
COLOR5_SOLID=$(hex_to_rgba "$color5" 0.80)
COLOR5_TRANS=$(hex_to_rgba "$color5" 0.80)

# Crear configuración de hyprlock
cat >~/.config/hypr/hyprlock.conf <<EOF
# Configuración generada automáticamente por pywal
# $(date)

general {
    hide_cursor = true
    grace = 5
    fractional_scaling = 2
}

background {
    monitor =
    path = $WALLPAPER
    color = rgba(20,20,20,0.7)

    blur_passes = 2
    blur_size = 3
    noise = 0.0117
    contrast = 0.8916
    brightness = 0.8172
    vibrancy = 0.1696
    vibrancy_darkness = 0.0
}

#PROFILE-PHOTO
image {
    monitor =
    path = ~/Imágenes/wallpapers/anime-boy-chill.jpg
    size = 100
    rounding = -1
    border_size = 4
    border_color = $COLOR5_TRANS
    rotate = 0
    reload_time = -1
    reload_cmd =

    position = 0, 160
    halign = center
    valign = center
    zindex = 0
}

#HELLO
label {
    monitor =
    text = Hola
    text_align = center
    color = $FOREGROUND
    font_size = 20
    font_family = JetBrainsMonoNL Nerd Font
    rotate = 0

    position = 0, 70
    halign = center
    valign = center
}

#TIME
label {
     monitor =
    text = \$TIME12
    text_align = center
    color = $FOREGROUND_SOLID
    font_size = 60
    font_family = jetbrainsMonoNL Nerd Font
    rotate = 0

    position = 0, 0
    halign = center
    valign = center
}

#DATE
label {
    monitor =
    text = cmd[update:1000] echo -e "\$(date +"%A, %d %B")"
    text_align = center
    color = $FOREGROUND_SOLID
    font_size = 20
    font_family = jetbrainsMonoNL Nerd Font
    rotate = 0

    position = 0, -60
    halign = center
    valign = center
}

#USER BOX
shape {
    monitor =
    size = 320, 55
    color = $FOREGROUND_TRANS
    rounding = -1
    border_size = 1
    border_color = $FOREGROUND
    rotate = 0
    xray = false

    position = 0, -125
    halign = center
    valign = center
    zindex = 0
}

#HELLO
label {
    monitor =
    text =  $USER
    text_align = center
    color = $FOREGROUND_SOLID
    font_size = 20
    font_family = JetBrainsMonoNL Nerd Font
    rotate = 0

    position = 0, -125
    halign = center
    valign = center
}


input-field {
    monitor =
    size = 320, 55
    outline_thickness = 0
    dots_size = 0.2
    dots_spacing = 0.2
    dots_center = true
    dots_rounding = -1
    dots_text_format =
    outer_color = $FOREGROUND
    inner_color = $FOREGROUND_TRANS
    font_color = rgb(200,200,200)
    font_family = JetBrainsMonoNL Nerd Font
    fade_on_empty = false
    fade_timeout = 1000
    placeholder_text = <i><span foreground="#$foreground">🔒 Contraseña</span></i>
    hide_input = false
    hide_input_base_color = $FOREGROUND_SOLID
    rounding = -1
    check_color = $COLOR5_SOLID
    fail_color = rgba(244,67,54,0.80)
    fail_text = <i>\$FAIL <b>(\$ATTEMPTS)</b></i>
    capslock_color = $COLOR1_TRANS
    numlock_color = $COLOR2_TRANS
    bothlock_color = $COLOR3_TRANS
    invert_numlock = false
    swap_font_color = false

    position = 0, -200
    halign = center
    valign = center
    zindex = 0
}
EOF

echo "Configuración de hyprlock actualizada con colores de pywal"
