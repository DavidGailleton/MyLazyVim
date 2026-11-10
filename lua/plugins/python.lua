return {
  -- Python LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
          before_init = function(_, config)
            local root = config.root_dir
            if not root then
              return
            end

            local venv = root .. "/.venv"
            if vim.fn.isdirectory(venv) == 1 then
              config.settings = config.settings or {}
              config.settings.python = config.settings.python or {}

              -- Tell pyright where the venv is
              config.settings.python.venvPath = root
              config.settings.python.venv = ".venv"

              -- Optional: set exact interpreter path too
              local python_bin = venv .. "/bin/python"
              if vim.fn.has("win32") == 1 then
                python_bin = venv .. "/Scripts/python.exe"
              end

              config.settings.python.pythonPath = python_bin
            end
          end,
        },

        ruff = {},
      },
    },
  },
}
