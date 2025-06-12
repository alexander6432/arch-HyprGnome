local restore_file = ya.sync(function()
  local hovered = cx.active.current.hovered
  if not hovered then
    return "Nada seleccionado"
  end

  local name = hovered.name
  local trashinfo_path = os.getenv("HOME") .. "/.local/share/Trash/info/" .. name .. ".trashinfo"

  local file = io.open(trashinfo_path, "r")
  if not file then
    return "No se encontró .trashinfo"
  end

  local original_path
  for line in file:lines() do
    original_path = line:match("^Path=(.+)")
    if original_path then break end
  end
  file:close()

  if not original_path then
    return "No se encontró el path original"
  end

  local command = '~/.config/yazi/plugins/trash.yazi/restore.sh "' .. original_path .. '"'
  local ok, exit_type, code = os.execute(command)

  if ok and code == 0 then
    return "Restaurado: " .. original_path
  else
    return string.format("Error al restaurar (tipo: %s, código: %s)", tostring(exit_type), tostring(code))
  end
end)

return {
  entry = function()
    local msg = restore_file()
    ya.notify {
      title = "Restaurar archivo",
      content = msg,
      timeout = 6,
      level = "info",
    }
  end
}
