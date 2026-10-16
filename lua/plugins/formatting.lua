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
          -- Use the project's .clang-format if any, else LLVM with tabs
          prepend_args = function(_, ctx)
            local has_config = vim.fs.find({ ".clang-format", "_clang-format" }, {
              path = ctx.dirname,
              upward = true,
            })[1]
            if has_config then
              return { "--style=file" }
            end
            return {
              "--style={BasedOnStyle: LLVM, UseTab: Always, IndentWidth: 4, TabWidth: 4}",
            }
          end,
        },
        jq = {
          prepend_args = { "." },
        },
      },
    },
  },
}
