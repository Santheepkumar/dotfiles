local M = {}

function M.copy_neo_tree_file_path()
  local path = require("neo-tree.sources.manager").get_state("filesystem").tree:get_node().path
  if path then
    vim.fn.setreg("+", path) -- Copy to system clipboard
    print("Copied: " .. path)
  else
    print("No file selected")
  end
end

function M.open_in_nautilus()
  local file_path = vim.fn.expand("%:p") -- Get full path of current file
  if file_path == "" then
    print("No file is currently open")
    return
  end
  local dir_path = vim.fn.fnamemodify(file_path, ":h") -- Extract directory path
  vim.fn.jobstart({ "nautilus", dir_path }, { detach = true })
  print("Opened in Nautilus: " .. dir_path)
end

function M.open_in_tree_nautilus()
  local node = require("neo-tree.sources.manager").get_state("filesystem").tree:get_node()
  if not node or not node.path then
    print("No file or folder selected")
    return
  end

  local path = node.path
 -- Extract directory path
  vim.fn.jobstart({ "nautilus", path }, { detach = true })
  print("Opened in Nautilus: " .. path)
end

function M.open_in_vscode()
  local node = require("neo-tree.sources.manager").get_state("filesystem").tree:get_node()
  if not node or not node.path then
    print("No file or folder selected")
    return
  end

  local path = node.path
  vim.fn.jobstart({ "code", path }, { detach = true })
  print("Opened in VS Code: " .. path)
end

return M
