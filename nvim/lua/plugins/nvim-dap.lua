return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = 8123,
      executable = {
        command = "js-debug-adapter",
      },
    }

    for _, language in ipairs { "typescript", "javascript" } do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Process",
          processId = function()
            local handle = io.popen("pgrep -n node") -- Automatically get the latest Node.js process
            local result = handle:read("*a") or ""
            handle:close()
            return tonumber(result)
          end,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**" },
        },
      }
    end
  end,
}
