local map = vim.keymap.set
map("n", "<leader>un", require("undotree").toggle, { desc = "Toggle Undotree", noremap = true, silent = true })

-- or
-- map("n", "<leader>uo", require("undotree").open, { noremap = true, silent = true })
-- map("n", "<leader>uc", require("undotree").close, { noremap = true, silent = true })

map("i", "jk", "<ESC>")
-- Normal mode: Move the current line up or down
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual mode: Move selected lines up or down
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Quick fix
map("n", "<A-j>", "<cmd>cnext<CR>")
map("n", "<A-k>", "<cmd>cprev<CR>")
-- Prime

-- map("n", "<leader>pv", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", '"_d')

map("i", "<C-c>", "<Esc>")
-- This is going to get me cancelled

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>f", vim.lsp.buf.format)

map("v", "yo", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Go to the next buffer
map("n", "A-z", ":bnext<CR>", { noremap = true, silent = true })

-- Go to the previous buffer
--
map("n", "A-x", ":bprevious<CR>", { noremap = true, silent = true })

-- Spectre

map("n", "<leader>R", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})
map({ "n", "v" }, "<C-x>", '"_dd', {
  desc = "Del without yanking",
})

map("n", "<leader>tw", "<cmd>Twilight<CR>", { noremap = true, silent = true, desc = "Toggle Twilight" })
map({ "n", "i" }, "<C-A-i>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
map("v", "<leader>sx", ":CarbonNow<CR>", { silent = true, desc = "Snap code carbon" })

-- map('n', 'p', '"_dP', { noremap = true, silent = true })
-- map('n', 'P', '"_dP', { noremap = true, silent = true })

-- ufo
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)

-- obsidian
map("n", "<leader>oo", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian Backlinks" })
map("n", "<leader>of", "<cmd>ObsidianFollowLink<cr>", { desc = "Obsidian Follow Link" })
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian New Note" })
map("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Obsidian Today" })
map("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", { desc = "Obsidian Yesterday" })
map("n", "<leader>or", "<cmd>ObsidianTomorrow<cr>", { desc = "Obsidian Tomorrow" })
map("n", "<leader>fp", "0<c-g>", { desc = "Show full file path" })

-- map("n", "<leader>sc", ":set spell!<CR>", opts)

-- map("n", "<leader>ad", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open" })
-- Bookmarks
map(
  "n",
  "<leader>fB",
  "<cmd>lua require('telescope').extensions.bookmarks.list()<CR>",
  { desc = "Open Bookmarks in Telescope", silent = true }
)
local utils = require "utils"
-- Copy file path from Neo-tree
map(
  "n",
  "<leader>af",
  function() utils.copy_neo_tree_file_path() end,
  { noremap = true, silent = true, desc = "Copy file path" }
)

--- Open current currrent file in Nautilus
map(
  "n",
  "<leader>aO",
  function() utils.open_in_nautilus() end,
  { noremap = true, silent = true, desc = "Open current file in Nautilus" }
)

--- Open new tree file in Nautilus
map(
  "n",
  "<leader>ao",
  function() utils.open_in_tree_nautilus() end,
  { noremap = true, silent = true, desc = "Open tree path in Nautilus" }
)
-- Open current file in VS code
map(
  "n",
  "<leader>av",
  function() utils.open_in_vscode() end,
  { noremap = true, silent = true, desc = "Open in VS code" }
)

vim.opt.clipboard = "unnamedplus"

-- Copy to system clipboard
map("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Paste from system clipboard
map("n", "<C-v>", '"+p', { noremap = true, silent = true })
map("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
map("c", "<C-v>", "<C-r>+", { noremap = true, silent = true })

-- Prevent overwriting clipboard when pasting
map("v", "p", '"_dP', { noremap = true, silent = true })

-- MiniMap shortcuts
map("n", "<Leader>mo", '<cmd>lua require("mini.map").open()<cr>', { noremap = true, silent = true }) -- Open MiniMap
map("n", "<Leader>mc", '<cmd>lua require("mini.map").close()<cr>', { noremap = true, silent = true }) -- Close MiniMap

-- Neo Tree
map("n", "<Leader>ab", ":Neotree buffers<CR>")
