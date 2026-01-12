return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",
    -- Required by nvim-dap-ui
    "nvim-neotest/nvim-nio",
    -- Inline virtual text for debugging
    "theHamsta/nvim-dap-virtual-text",
    -- Language-specific debugger plugins
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
    -- Neovim Lua debugging
    "jbyuki/one-small-step-for-vimkind",
    -- JavaScript/TypeScript debugging
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      version = "1.*",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      opts = {
        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
        adapters = {
          "chrome",
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "pwa-extensionHost",
          "node-terminal",
        },
      },
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup DAP UI
    dapui.setup()

    -- Setup virtual text
    require("nvim-dap-virtual-text").setup()

    -- Automatically open/close DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- ============================================
    -- Python Configuration
    -- ============================================
    local mason_packages = vim.fn.stdpath("data") .. "/mason/packages/"
    require("dap-python").setup(mason_packages .. "debugpy/venv/bin/python")

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return vim.fn.exepath("python")
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "Launch file (w/ external code)",
        program = "${file}",
        pythonPath = function()
          return vim.fn.exepath("python")
        end,
        justMyCode = false,
      },
      {
        type = "python",
        request = "launch",
        name = "Launch file with pytest",
        module = "pytest",
        args = { "${file}" },
        justMyCode = false,
        pythonPath = function()
          return vim.fn.exepath("python")
        end,
      },
    }

    -- ============================================
    -- Go Configuration
    -- ============================================
    require("dap-go").setup()

    -- ============================================
    -- JavaScript/TypeScript Configuration
    -- ============================================
    for _, language in ipairs({ "typescript", "javascript", "javascriptreact", "typescriptreact" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch & Debug Chrome",
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:3000",
              }, function(url)
                if url == nil or url == "" then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = vim.fn.getcwd(),
          protocol = "inspector",
          sourceMaps = true,
          userDataDir = false,
        },
        {
          name = "----- launch.json configs -----",
          type = "",
          request = "launch",
        },
      }
    end

    -- ============================================
    -- Lua/Neovim Configuration
    -- ============================================
    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }

    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    vim.api.nvim_create_user_command("NeovimDebugStart", function()
      require("osv").launch({ port = 8086 })
    end, {})
  end,
}
