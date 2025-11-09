-- ~/.config/yazi/init.lua
-- https://yazi-rs.github.io/docs/configuration/yazi
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

require("zoxide"):setup({
	update_db = true,
})

-- https://github.com/yazi-rs/plugins/tree/main/smart-enter.yazi
require("smart-enter"):setup({
	open_multi = true,
})

require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

-- https://github.com/uhs-robert/recycle-bin.yazi
-- require("recycle-bin"):setup({
-- 	-- Optional: Override automatic trash directory discovery
-- 	trash_dir = "~/.local/share/Trash/", -- Uncomment to use specific directory
-- })
--
-- https://github.com/yazi-rs/plugins/tree/main/git.yazi
-- require("git"):setup()
