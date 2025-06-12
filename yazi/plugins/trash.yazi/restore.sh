#!/bin/bash

# Recibe el path original del archivo a restaurar como argumento
FILE_PATH="$1"

# Verifica que se pasó un argumento
if [ -z "$FILE_PATH" ]; then
  echo "Falta el argumento del path"
  exit 1
fi

# Pasa la confirmación automáticamente
echo 0 | trash-restore "$FILE_PATH"
