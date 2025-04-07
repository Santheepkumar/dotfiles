
autocmd("FocusGained", {
  command = "checktime"
})

-- custom auto comman disini
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local exclude_ft = {
			"qf",
			"NvimTree",
			"toggleterm",
			"TelescopePrompt",
			"alpha",
			"netrw",
		}

		local map = require("mini.map")
		if vim.tbl_contains(exclude_ft, vim.o.filetype) then
			vim.b.minimap_disable = true
			map.close()
		elseif vim.o.buftype == "" then
			map.open()
		end
	end,
})
