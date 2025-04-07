-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end
-- vim.schedule(function() require "mappings" end)
require "lazy_setup"
require "polish"
require "mappings"
require("telescope").load_extension "harpoon"
require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
     },
  },
}
require("neoscroll").setup { mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" } }
require("lazy").setup {
  "JoosepAlviste/nvim-ts-context-commentstring",
}

require("nvim-treesitter.configs").setup {
  context_commentstring = {
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
      typescript = { __default = "// %s", __multiline = "/* %s */" },
    },
  },
}
