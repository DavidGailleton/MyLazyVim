return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        c = { "clang_format" },
        json = { "jq" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length", "79" },
        },
        clang_format = {
          prepend_args = { "--style=file", "--fallback-style=LLVM" },
        },
        jq = {
          prepend_args = { "." },
        },
      },
      -- optional: ensure format-on-save is enabled
      format_on_save = { timeout_ms = 3000, lsp_fallback = true },
    },
  },
}
