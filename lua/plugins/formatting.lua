return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length", "79" },
        },
      },
      -- optional: ensure format-on-save is enabled
      format_on_save = { timeout_ms = 3000, lsp_fallback = true },
    },
  },
}
