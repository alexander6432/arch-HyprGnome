#!/bin/bash

CONFIG_INI="$HOME/.config/waypaper/config.ini"
LOCK_FILE="/tmp/waypaper_monitor.lock"
PID_FILE="/tmp/waypaper_monitor.pid"
PREVIOUS_WALLPAPER=""

# Función de limpieza
cleanup() {
  # Matar procesos de matugen que puedan estar corriendo
  killall -q matugen

  # Matar procesos inotifywait relacionados con waypaper
  pkill -f "inotifywait.*waypaper/config.ini"

  # Remover archivos de lock y pid
  rm -f "$LOCK_FILE" "$PID_FILE"

  exit 0
}

# Configurar trap para limpieza
trap cleanup SIGINT SIGTERM EXIT

# Verificar si ya hay una instancia corriendo
if [ -f "$LOCK_FILE" ]; then
  if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE")
    if kill -0 "$OLD_PID" 2>/dev/null; then
      kill "$OLD_PID"
      sleep 1
    fi
  fi

  # Limpiar procesos huérfanos
  pkill -f "inotifywait.*waypaper/config.ini"
  rm -f "$LOCK_FILE" "$PID_FILE"
fi

# Crear lock file
touch "$LOCK_FILE"
echo $$ >"$PID_FILE"

# Obtener el wallpaper actual desde config.ini
get_current_wallpaper() {
  if [ -f "$CONFIG_INI" ]; then
    WALLPAPER_LINE=$(grep '^wallpaper' "$CONFIG_INI" | cut -d'=' -f2- | xargs)
    echo "${WALLPAPER_LINE/#\~/$HOME}"
  fi
}

# Procesar cambio de wallpaper con protección contra ejecuciones múltiples
process_config_change() {
  local MATUGEN_LOCK="/tmp/matugen_processing.lock"

  # Si ya se está procesando, salir
  if [ -f "$MATUGEN_LOCK" ]; then
    return
  fi

  CURRENT_WALLPAPER=$(get_current_wallpaper)

  if [ "$CURRENT_WALLPAPER" != "$PREVIOUS_WALLPAPER" ] && [ -f "$CURRENT_WALLPAPER" ]; then
    # Crear lock para matugen
    touch "$MATUGEN_LOCK"

    # Matar cualquier proceso de matugen anterior
    killall -q matugen
    sleep 0.5

    # Ejecutar matugen
    matugen image "$CURRENT_WALLPAPER" >/dev/null 2>&1

    # Remover lock
    rm -f "$MATUGEN_LOCK"

    PREVIOUS_WALLPAPER="$CURRENT_WALLPAPER"
  fi
}

# Monitorear el archivo config.ini
start_monitoring() {
  PREVIOUS_WALLPAPER=$(get_current_wallpaper)

  while [ -f "$LOCK_FILE" ]; do
    if [ -f "$CONFIG_INI" ]; then
      # Usar timeout para evitar bloqueos indefinidos
      timeout 30 inotifywait -e modify,move_self "$CONFIG_INI" >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        sleep 0.3 # Pequeña pausa para evitar múltiples triggers
        process_config_change
      fi
    else
      timeout 30 inotifywait -e create "$(dirname "$CONFIG_INI")" >/dev/null 2>&1
      sleep 1
    fi
  done
}

# Limpiar procesos previos antes de empezar
killall -q matugen
pkill -f "inotifywait.*waypaper/config.ini"

# Ejecutar Waypaper en background
waypaper &
WAYPAPER_PID=$!

# Pequeña pausa para que waypaper se inicie
sleep 2

# Iniciar monitoreo
start_monitoring &
MONITOR_PID=$!

# Esperar a que termine Waypaper
wait $WAYPAPER_PID

# Si matugen está en ejecución, esperar hasta 5 segundos
WAIT_TIME=0
MATUGEN_LOCK="/tmp/matugen_processing.lock"

while [ -f "$MATUGEN_LOCK" ] && [ $WAIT_TIME -lt 5 ]; do
  sleep 1
  WAIT_TIME=$((WAIT_TIME + 1))
done

# Ahora sí limpiar y salir
cleanup
