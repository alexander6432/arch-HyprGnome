function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		local hour = tonumber(os.date("%H", time))
		local suffix = hour < 12 and "AM" or "PM"
		time = os.date("%d %b %I:%M ", time) .. suffix
	else
		time = os.date("%d %b  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "", time)
end

require("git"):setup({
	order = 500,
})
require("full-border"):setup({ type = ui.Border.ROUNDED })
